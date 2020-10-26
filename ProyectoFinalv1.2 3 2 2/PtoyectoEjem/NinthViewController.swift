//
//  NinthViewController.swift
//  PtoyectoEjem
//
//  Created by Diego Villarreal on 27/05/20.
//  Copyright © 2020 Diego Villarreal. All rights reserved.
//

import UIKit

class NinthViewController: UIViewController {

    @IBOutlet weak var vut1: UIButton!
    @IBOutlet weak var vut2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        vut1.layer.cornerRadius  = 15
        vut2.layer.cornerRadius  = 15
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
