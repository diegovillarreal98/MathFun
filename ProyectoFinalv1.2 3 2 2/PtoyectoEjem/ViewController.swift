//
//  ViewController.swift
//  PtoyectoEjem
//
//  Created by Diego Villarreal on 22/04/20.
//  Copyright © 2020 Diego Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var but1: UIButton!
    @IBOutlet weak var but2: UIButton!
    @IBOutlet weak var but3: UIButton!
    @IBOutlet weak var but5: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        but1.layer.cornerRadius = 15
        but2.layer.cornerRadius = 15
        but3.layer.cornerRadius = 15
        but5.layer.cornerRadius = 15
        
        
        // Do any additional setup after loading the view.
    }

@IBAction func cancel(_ unwindSegue: UIStoryboardSegue) {}
}

