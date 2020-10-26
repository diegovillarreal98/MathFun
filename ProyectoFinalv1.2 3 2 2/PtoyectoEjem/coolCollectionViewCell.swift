//
//  coolCollectionViewCell.swift
//  PtoyectoEjem
//
//  Created by Diego Villarreal on 27/05/20.
//  Copyright © 2020 Diego Villarreal. All rights reserved.
//

import UIKit

class coolCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    var card: Card?
    
    
    func flipImage() {
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    
    func flipImageBack() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
    }
    
    
    func fadeOutCard() {
        self.backImageView.alpha = 0
        
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImageView.alpha = 0
        }, completion: nil)
        
    }
    
    func setCard(_ newCard: Card){
        
        self.card = newCard
        
        if card!.isMatched {
            
            backImageView.alpha = 0
            frontImageView.alpha = 0
            return
            
        } else {
            
            backImageView.alpha = 1
            frontImageView.alpha = 1
        }
            
            frontImageView.image = UIImage(named: card!.imageName)
            
            if card?.isFlipped == true{
                
                UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
                 
            } else {
                
                UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
            }
        
    }
    
}
