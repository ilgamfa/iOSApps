import UIKit
protocol Healthable {
    var health: Int {get set}
}

protocol Movable {
    func move()
}

extension Movable {
    func move() {
        print("Move")
    }
}
protocol Shootable {
    func shoot()
}

extension Shootable {
    func shoot() {
        print("Shoot")
    }
}



class Base: Healthable {
    var health = 0
}


class Tower: Shootable {
    func shoot() {
        
    }
}

class Enemy: Movable, Healthable {
    var health: Int = 10
    
    func move() {
        
    }
    
}

class ShootEnemy: Shootable, Healthable, Movable {
    var health: Int = 20
    
    
}


class MoveEnemy: ShootEnemy {
    
}


let menemy = MoveEnemy()
menemy.health


protocol Car {
    func move()
    var color: UIColor {get set}
    
    
}
