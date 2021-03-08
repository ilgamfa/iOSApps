//
//  ContentView.swift
//  Reminder
//
//  Created by Ильгам Ахматдинов on 08.03.2021.
//

import SwiftUI
import EventKit

let store = EKEventStore()

struct ContentView: View {
    
    @State var reminders: [EKReminder] = []
    @State var isAddViewShown: Bool = false
    
    var body: some View {
        NavigationView {
            List(self.reminders, id: \.calendarItemIdentifier) { reminder in
                NavigationLink(destination: AddOrEditReminderView(reminder: reminder)) {
                    HStack {
                        
                        Button(action: {
                            self.finishReminder(reminder)
                        }, label: {
                            Text(reminder.isCompleted ? "+" : "-")
                        })
                        .buttonStyle(CircleButtonStyle(isCompleted: reminder.isCompleted))
                        Text(reminder.title)
                    }
                }
                
            }
            .navigationTitle("Напоминания")
            .onAppear(perform: {
                self.requestAccess()
            })
            .onReceive(NotificationCenter.default.publisher(for: .EKEventStoreChanged, object: store), perform: { _ in
                self.getReminders()
            })
            .toolbar(content: {
                Button(action: {
                    self.isAddViewShown = true
                }, label: {
                    Image(systemName: "plus")
                })
            })
            .sheet(isPresented: $isAddViewShown, content: {
                NavigationView {
                    AddOrEditReminderView()
                }
            })
        }
    }
    func finishReminder(_ reminder: EKReminder) {
        reminder.isCompleted.toggle()
        try? store.save(reminder, commit: true)
    }
    func requestAccess(){
        let store = EKEventStore()
        store.requestAccess(to: .reminder) { (isSucces, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if isSucces {
                self.getReminders()
            }
            
        }
    }
    
    func getReminders() {
        guard let calendar = store.defaultCalendarForNewReminders() else { return }
        let predicate = store.predicateForReminders(in: [calendar])
        store.fetchReminders(matching: predicate) { reminders in
            self.reminders = reminders ?? []
        }
        
    }
    
}

struct CircleButtonStyle: ButtonStyle {
    
    let isCompleted: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 3)
            .background(
                ZStack {
                    Circle()
                        .stroke(Color.green, lineWidth: 1)
                    Circle()
                        .fill(self.backgroundViev(configuration: configuration))
                }
            )
            .frame(width: 32, height: 32)
            .foregroundColor(isCompleted ? .white : .clear)
        
    }
    private func backgroundViev(configuration: Configuration) -> Color {
        if self.isCompleted {
            return configuration.isPressed ? Color.green.opacity(0.1) : Color.green
        } else {
            return configuration.isPressed ? Color.green.opacity(0.1) : Color.clear
        }
    }
}



struct AddOrEditReminderView: View {
    
    @State var title: String = ""
    @State var alarmDate: Date = Date()
    @Environment(\.presentationMode) var presentationMode
    
    private let reminder: EKReminder?
    
    init(reminder: EKReminder? = nil) {
        self.reminder = reminder
        self._title = State(initialValue: reminder?.title ?? "")
    }
    
    
    var body: some View {
        Form {
            Section(header: Text("Информация"), content :{
                TextField("Имя напоминания", text: $title)
            })
            
            Section(header: Text("Будильники"), content: {
                DatePicker(selection: $alarmDate, displayedComponents:
                            [.hourAndMinute, .date], label: {
                                Text("Alarm")
                            })
            })
            
        }
        .toolbar(content: {
            Button(action: {
                self.saveReminder()
            }, label: {
                Text(reminder == nil ? "Create" : "Save")
            })
        })
        .navigationBarTitle(reminder == nil ? Text("Add remind") :
                                Text("Change remind"), displayMode: .inline)
    
    }
        
    func saveReminder() {
        
        let reminderToSave: EKReminder
        
        if let reminder = self.reminder {
                reminderToSave = reminder
        } else {
            let reminder = EKReminder(eventStore: store)
            reminder.title = self.title
            reminder.calendar = store.defaultCalendarForNewReminders()
            reminder.alarms = [EKAlarm.init(absoluteDate: self.alarmDate)]
            reminderToSave = reminder
        }
        
        
        do {
            try store.save(reminderToSave, commit: true)
            self.presentationMode.wrappedValue.dismiss()
        } catch {
            print(error.localizedDescription)
        }
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
