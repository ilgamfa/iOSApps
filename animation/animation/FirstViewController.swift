//
//  FirstViewController.swift
//  animation
//
//  Created by Ильгам Ахматдинов on 01.04.2021.
//

import UIKit
import ViewAnimator

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .systemPurple
        myView.animate(animations: [AnimationType.rotate(angle: .pi/5)], delay: 1, duration: 1)
        
    }

}


class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .systemPurple
        myView.animate(animations: [AnimationType.zoom(scale: 4)], delay: 1, duration: 1)
        
    }

}

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .systemOrange
        
        let animations: [Animation] = [
            AnimationType.identity,
            AnimationType.rotate(angle: .pi/4),
            AnimationType.zoom(scale: 3)
        ]
        myView.animate(animations: animations, delay: 1, duration: 1, usingSpringWithDamping: 1, initialSpringVelocity: 4)
        
    }

}


class RandomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .systemBlue
        myView.animate(animations: [AnimationType.random()], delay: 1, duration: 1)
        
    }

}
