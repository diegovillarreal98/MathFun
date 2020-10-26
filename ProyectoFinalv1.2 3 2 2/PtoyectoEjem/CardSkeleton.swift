//
//  CardSkeleton.swift
//  PtoyectoEjem
//
//  Created by Diego Villarreal on 27/05/20.
//  Copyright © 2020 Diego Villarreal. All rights reserved.
//


import Foundation

class CardSkeleton {
    
    
    func getCards() -> [Card] {
        
        //array for numbers already generated
        var generatedNums = [Int]()
        
        //array to store the cards
        var cardsArray = [Card]()
        
        //generates pair of cards
        while generatedNums.count < 6 {
            
            let randomNumber = arc4random_uniform(6) + 1
            
            let randomSection = arc4random_uniform(4)
            
            if generatedNums.contains(Int(randomNumber)) == false {
                //log the number
                print(randomNumber)
                
                generatedNums.append(Int(randomNumber))
                
                //crear aqui algo para que agarre cartas de suma, resta, multiplicacion o division
                
                let firstCard = Card()
                //firstCard.imageName = "card\(randomNumber)"
                //secondCard.imageName = "card\(randomNumber)"

                if randomSection == 0{
                    firstCard.imageName = "sumP\(randomNumber)"
                    cardsArray.append(firstCard)
                }else if randomSection == 1{
                    firstCard.imageName = "subP\(randomNumber)"
                    cardsArray.append(firstCard)
                }else if randomSection == 2{
                    firstCard.imageName = "multP\(randomNumber)"
                    cardsArray.append(firstCard)
                }else if randomSection == 3{
                    firstCard.imageName = "divP\(randomNumber)"
                    cardsArray.append(firstCard)
                }
                
                
                let secondCard = Card()
                
                if randomSection == 0{
                    secondCard.imageName = "sumR\(randomNumber)"
                    cardsArray.append(secondCard)
                }else if randomSection == 1{
                    secondCard.imageName = "subR\(randomNumber)"
                    cardsArray.append(secondCard)
                }else if randomSection == 2{
                    secondCard.imageName = "multR\(randomNumber)"
                    cardsArray.append(secondCard)
                }else if randomSection == 3{
                    secondCard.imageName = "divR\(randomNumber)"
                    cardsArray.append(secondCard)
                }
                
                
            }
        }
        
        for i in 0...cardsArray.count - 1 {
            
            let randomNum = Int(arc4random_uniform(UInt32(cardsArray.count)))
            
            let temp = cardsArray[i]
            cardsArray[i] = cardsArray[randomNum]
            cardsArray[randomNum] = temp
            
        }
        
        return cardsArray
    }
}
