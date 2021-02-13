let fio = [
    ("Ivanov", "Ivan", "Ivanovich"),
    ("Petrov", "Petr", "Petrovich"),
    ("Alexandrov", "Alex", "Alexandrovich")
]

func printFio(_ fio: [(String, String, String)], mode: Int) {
    for item in fio {
        switch mode {
        case 1:
            print(item.0, item.1, item.2)
        case 2:
            print(item.0, item.1)
        case 3:
            print(item.0)
        default:
            print("Error mode not find")
        }
    }
}


printFio(fio, mode: 4 )
