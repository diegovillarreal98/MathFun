//
//  SeventhViewController.swift
//  PtoyectoEjem
//
//  Created by user168657 on 5/26/20.
//  Copyright © 2020 Diego Villarreal. All rights reserved.
//

import UIKit

class SeventhViewController: UIViewController {

    @IBOutlet weak var lbTiempo: UILabel!
    @IBOutlet weak var vida1: UIImageView!
    @IBOutlet weak var vida2: UIImageView!
    @IBOutlet weak var vida3: UIImageView!
    
    @IBOutlet weak var but1: UIButton!
    @IBOutlet weak var but2: UIButton!
    
    var tiempo: String = ""
    var vidas: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        but1.layer.cornerRadius = 15
        but2.layer.cornerRadius = 15
        
        lbTiempo.text = tiempo
        if vidas == 1 {
            vida3.isHidden = true
            vida2.isHidden = true
        }
        else if vidas == 2 {
            vida3.isHidden = true
        }
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
