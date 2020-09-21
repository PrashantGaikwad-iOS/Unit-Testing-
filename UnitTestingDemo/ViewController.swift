//
//  ViewController.swift
//  UnitTestingDemo
//
//  Created by Prashant Gaikwad on 13/09/20.
//  Copyright © 2020 Prashant Gaikwad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}

struct User {
    var name:String
    var age:Int 
    
    init(name1: String, age1: Int) {
        self.name = name1
        self.age = age1
    }
}

struct Users: Codable {
    let id: Int
    let name: String
}
