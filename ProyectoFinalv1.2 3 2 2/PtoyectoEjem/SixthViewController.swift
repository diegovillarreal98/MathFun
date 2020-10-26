//
//  SixthViewController.swift
//  PtoyectoEjem
//
//  Created by Diego Villarreal on 22/04/20.
//  Copyright © 2020 Diego Villarreal. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {

    @IBOutlet weak var lbTiempo: UILabel!
    @IBOutlet weak var vida1: UIImageView!
    @IBOutlet weak var vida2: UIImageView!
    @IBOutlet weak var vida3: UIImageView!
    @IBOutlet weak var Problema: UILabel!
    @IBOutlet weak var res1: UIButton!
    @IBOutlet weak var res2: UIButton!
    @IBOutlet weak var res3: UIButton!
    @IBOutlet weak var res4: UIButton!
    
    @IBAction func Restart(_ unwindSegue: UIStoryboardSegue){}
    
    var count2 = 3
    var timer = Timer()
    var count = 0
    var tiempoMovimeinto: Timer! // Timer usado para mover los botones de las opciones
    
    var operaciones = ["+", "-", "x", "÷"]
    var operando1: Int!
    var operando2: Int!
    var operacion: String!
    var resultado: Int!
    var numProb: Int!
    var resTemp: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        res1.layer.cornerRadius = 60
        res2.layer.cornerRadius = 60
        res3.layer.cornerRadius = 60
        res4.layer.cornerRadius = 60
        
        operando2 = 0
        operando1 = 0
        resultado = 0
        numProb = 0
        resTemp = 0
        
        operaciones.shuffle()
        operacion = operaciones[0]
        operando1 = Int.random(in: 1..<21)
        operando2 = Int.random(in: 1..<10)

        if operacion == "-" {
            while(operando1 < operando2) {
                operando1 = Int.random(in: 1..<21)
                operando1 = Int.random(in: 1..<10)
            }
        }
        else if operacion == "÷" {
            while(operando1 % operando2 != 0) {
                operando1 = Int.random(in: 1..<21)
                operando1 = Int.random(in: 1..<10)
            }
        }
        
        switch operacion {
            case "+":
                resultado = operando1 + operando2
            case "-":
                resultado = operando1 - operando2
            case "x":
                resultado = operando1 * operando2
            case "÷":
                resultado = operando1 / operando2
            default:
                print("No se encontro la operacion")
        }
       
        Problema.text = String(operando1) + " ___ " + String(operando2) + " = " + String(resultado)
        
        asignaOpciones(num: Int.random(in: 1..<5), resultado: resultado)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeSecs), userInfo: nil, repeats: true)
        
        tiempoMovimeinto = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(moverBoton), userInfo: nil, repeats: true)
    }
    
    
    @objc func changeSecs(){
        count += 1
        lbTiempo.text = String(count)
    }
   
    // MARK: - Movimiento de botones
    // Mueve las opciones por la pantalla de manera vertical
    @objc func moverBoton () {
        // Variables locales para Opcion1
        let vy = self.view.frame.size.height
        let vx = self.view.frame.size.width
        let bw = res1.frame.size.width
        let bx = res1.frame.origin.x
        let by = res1.frame.origin.y
        
        if (by < 0 - res1.frame.size.height) {
            let randX = CGFloat.random(in: 0..<(CGFloat(vx) - CGFloat(bw)))

            res1.frame.origin = CGPoint(x: randX, y: vy - res1.frame.size.height)
        }
        else {
            self.res1.frame.origin = CGPoint(x: bx, y: by - 5)
        }
        
        // Variables locales para Opcion2
        let vy2 = self.view.frame.size.height
        let vx2 = self.view.frame.size.width
        let bw2 = res2.frame.size.width
        let bx2 = res2.frame.origin.x
        let by2 = res2.frame.origin.y
        
        if (by2 < 0 - res2.frame.size.height) {
            var randX2 = CGFloat.random(in: 0..<(CGFloat(vx2) - CGFloat(bw2)))
            
            while(randX2 == res1.frame.size.width / 2) {
                randX2 = CGFloat.random(in: 0..<(CGFloat(vx2) - CGFloat(bw2)))
            }

            res2.frame.origin = CGPoint(x: randX2, y: vy2 - res2.frame.size.height)
        }
        else {
            self.res2.frame.origin = CGPoint(x: bx2, y: by2 - 5)
        }
        
        // Variables locales para Opcion3
        let vy3 = self.view.frame.size.height
        let vx3 = self.view.frame.size.width
        let bw3 = res3.frame.size.width
        let bx3 = res3.frame.origin.x
        let by3 = res3.frame.origin.y
        
        if (by3 < 0 - res3.frame.size.height) {
            var randX3 = CGFloat.random(in: 0..<(CGFloat(vx3) - CGFloat(bw3)))
            
            while(randX3 == res1.frame.size.width / 2 || randX3 == res2.frame.size.width / 2) {
                randX3 = CGFloat.random(in: 0..<(CGFloat(vx3) - CGFloat(bw3)))
            }

            res3.frame.origin = CGPoint(x: randX3, y: vy3 - res3.frame.size.height)
        }
        else {
            self.res3.frame.origin = CGPoint(x: bx3, y: by3 - 5)
        }
        
        // Variables locales para Opcion3
        let vy4 = self.view.frame.size.height
        let vx4 = self.view.frame.size.width
        let bw4 = res4.frame.size.width
        let bx4 = res4.frame.origin.x
        let by4 = res4.frame.origin.y
        
        if (by4 < 0 - res4.frame.size.height) {
            var randX4 = CGFloat.random(in: 0..<(CGFloat(vx4) - CGFloat(bw4)))
            
            while(randX4 == res1.frame.size.width / 2 || randX4 == res2.frame.size.width / 2 || randX4 == res3.frame.size.width / 2) {
                randX4 = CGFloat.random(in: 0..<(CGFloat(vx4) - CGFloat(bw4)))
            }

            res4.frame.origin = CGPoint(x: randX4, y: vy4 - res4.frame.size.height)
        }
        else {
            self.res4.frame.origin = CGPoint(x: bx4, y: by4 - 5)
        }
        
    }
    
    //MARK: - Asignar opciones
    func asignaOpciones(num: Int, resultado: Int) {
        switch num {
            case 1:
                res1.setTitle(operaciones[0], for: .normal)
                res2.setTitle(operaciones[1], for: .normal)
                res3.setTitle(operaciones[2], for: .normal)
                res4.setTitle(operaciones[3], for: .normal)
                
            case 2:
                res2.setTitle(operaciones[0], for: .normal)
                res1.setTitle(operaciones[1], for: .normal)
                res3.setTitle(operaciones[2], for: .normal)
                res4.setTitle(operaciones[3], for: .normal)
            
            case 3:
                res3.setTitle(operaciones[0], for: .normal)
                res2.setTitle(operaciones[1], for: .normal)
                res1.setTitle(operaciones[2], for: .normal)
                res4.setTitle(operaciones[3], for: .normal)
            
            case 4:
                res4.setTitle(operaciones[0], for: .normal)
                res2.setTitle(operaciones[1], for: .normal)
                res3.setTitle(operaciones[2], for: .normal)
                res1.setTitle(operaciones[3], for: .normal)
            
            default:
                print("No se asignaron las opciones")
        }
    }
    
    // MARK: - Acciones de botones
    @IBAction func PressedButton(_ sender: UIButton) {
        if let text = sender.titleLabel?.text {
            switch text {
                case "+":
                    resTemp = operando1 + operando2
                case "-":
                    resTemp = operando1 - operando2
                case "x":
                    resTemp = operando1 * operando2
                case "÷":
                    resTemp = operando1 / operando2
                default:
                    print("No se encontro la operacion")
            }
            
            if resTemp == resultado {
                // respuesta correcta
                sender.pulsar()
                if numProb != 5 {
                    siguienteProblema()
                }
            }
            else {
                sender.shake()
                // quita una vida
                if count2 == 3{
                    vida1.isHidden = true
                    siguienteProblema()
                }
                if count2 == 2{
                    vida2.isHidden = true
                    siguienteProblema()
                }
                if count2 == 1{
                    vida3.isHidden = true
                    timer.invalidate()
                    performSegue(withIdentifier: "lose", sender: nil)
                }
                count2 = count2-1
            }
        }
    }
    
    // MARK: - Funcion para cambiar de problema
    func siguienteProblema() {
        numProb = numProb + 1
        if numProb != 5 {
            operaciones.shuffle()
             operacion = operaciones[0]
             operando1 = Int.random(in: 1..<21)
             operando2 = Int.random(in: 1..<10)

             if operacion == "-" {
                 while(operando1 < operando2) {
                     operando1 = Int.random(in: 1..<21)
                     operando1 = Int.random(in: 1..<10)
                 }
             }
             else if operacion == "÷" {
                 while(operando1 % operando2 != 0) {
                     operando1 = Int.random(in: 1..<21)
                     operando1 = Int.random(in: 1..<10)
                 }
             }
             
             switch operacion {
                 case "+":
                     resultado = operando1 + operando2
                 case "-":
                     resultado = operando1 - operando2
                 case "x":
                     resultado = operando1 * operando2
                 case "÷":
                     resultado = operando1 / operando2
                 default:
                     print("No se encontro la operacion")
             }
            
             Problema.text = String(operando1) + " ___ " + String(operando2) + " = " + String(resultado)
             
             asignaOpciones(num: Int.random(in: 1..<5), resultado: resultado)
        }
        else {
            tiempoMovimeinto.invalidate()
            timer.invalidate()
            performSegue(withIdentifier: "win", sender: nil)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "win"{
            let vistaGanar = segue.destination as! SeventhViewController
            vistaGanar.tiempo = lbTiempo.text!
            vistaGanar.vidas = count2
        }
        if segue.identifier == "lose"{
            let vistaPerder = segue.destination as! EighthViewController
        }
    }
    

}
