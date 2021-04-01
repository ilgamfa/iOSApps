//
//  ViewController.swift
//  animation
//
//  Created by Ильгам Ахматдинов on 01.04.2021.
//

import UIKit
import ViewAnimator

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let myTable = UITableView()
        
    let data = ["Animation 1", "Animation 2", "Animation 3", "Animation 4", "Animation 5", "Animation 6", "Animation 7", "Animation 8", "Animation 9", "Animation 10", "Animation 11", "Animation 12",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTable)
        myTable.frame = view.bounds
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTable.delegate = self
        myTable.dataSource = self
            
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let animation = AnimationType.identity
        UIView.animate(views: myTable.visibleCells, animations: [animation], duration: 1)
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.backgroundColor = .link
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .systemRed
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            let vc = FirstViewController()
            
            present(vc, animated: true)
        }
        else if indexPath.row == 1 {
            let vc = SecondViewController()

            present(vc, animated: true)
        }
        else if indexPath.row == 2 {
            let vc = ThirdViewController()
            
            present(vc, animated: true)
        }
        else {
            let vc = RandomViewController()
            
            present(vc, animated: true)
        }
    }
    

    
    
    
    
}




