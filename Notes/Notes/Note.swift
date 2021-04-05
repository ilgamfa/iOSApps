//
//  Note.swift
//  Notes
//
//  Created by Ильгам Ахматдинов on 05.04.2021.
//
import CoreData

@objc(Note)
class Note: NSManagedObject
{
    @NSManaged var id: NSNumber!
    @NSManaged var title: String!
    @NSManaged var desc: String!
    @NSManaged var deletedDate: Date?
}
