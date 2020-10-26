//
//  ThirdViewController.swift
//  PtoyectoEjem
//
//  Created by Diego Villarreal on 22/04/20.
//  Copyright © 2020 Diego Villarreal. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var lbTiempo: UILabel!
    @IBOutlet weak var but1: UIButton!
    @IBOutlet weak var but2: UIButton!
    
    @IBOutlet weak var vida1: UIImageView!
    @IBOutlet weak var vida2: UIImageView!
    @IBOutlet weak var vida3: UIImageView!
    
    var Tiempo: String = ""
    var vidas: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        but1.layer.cornerRadius = 15
        but2.layer.cornerRadius = 15
        
        lbTiempo.text = Tiempo
        if vidas == 1{
            vida3.isHidden = true
            vida2.isHidden = true
        }
        else if vidas == 2 {
            vida3.isHidden = true
        }
        
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
