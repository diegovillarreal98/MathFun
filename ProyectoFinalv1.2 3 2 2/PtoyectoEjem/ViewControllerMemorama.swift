//
//  ViewControllerMemorama.swift
//  PtoyectoEjem
//
//  Created by Diego Villarreal on 27/05/20.
//  Copyright © 2020 Diego Villarreal. All rights reserved.
//

import UIKit

class ViewControllerMemorama: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    var model           = CardSkeleton()
    var coolCardArray   = [Card]()
    
    let numberOfCellsPerRow: CGFloat = 3
    
    var firstFlippedCardIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title                         = "Memorama"
        
        coolCardArray                 = model.getCards()
        
        myCollectionView.delegate     = self
        myCollectionView.dataSource   = self
        
//        if let flowLayout = myCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
//            let horizontalSpacing = flowLayout.scrollDirection == .vertical ? flowLayout.minimumInteritemSpacing : flowLayout.minimumLineSpacing
//            let cellWidth = (view.frame.width - max(0, numberOfCellsPerRow - 1)*horizontalSpacing)/numberOfCellsPerRow
//            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
//        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UICollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coolCardArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as!
        coolCollectionViewCell
        cell.contentView.layer.cornerRadius = 10
        let newCard =  coolCardArray[indexPath.row]
        cell.setCard(newCard)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! coolCollectionViewCell
        
        let card = coolCardArray[indexPath.row]
        
        if card.isFlipped == false && card.isMatched == false {
            
            cell.flipImage()
            card.isFlipped = true
            
            //first card being flipepd
            if firstFlippedCardIndex == nil{
                firstFlippedCardIndex = indexPath
                
                //second
            } else{
                
                checkCardsSelected(indexPath)
            }
        }
    }
    
    
    
    func checkCardsSelected(_ secondFlippedCardIndex: IndexPath){
     
        let cardOneCell = myCollectionView.cellForItem(at: firstFlippedCardIndex!) as? coolCollectionViewCell
        let cardTwoCell = myCollectionView.cellForItem(at: secondFlippedCardIndex) as? coolCollectionViewCell
        
        let firstCard = coolCardArray[firstFlippedCardIndex!.row]
        let secondCard = coolCardArray[secondFlippedCardIndex.row]
        
        let firstCardLength = firstCard.imageName.count
        let secondCardLength = secondCard.imageName.count
        
        
        let firstCardLast1 = firstCard.imageName.suffix(1)
        let secondCardLast1 = secondCard.imageName.suffix(1)
        
        
        let firstCardLast2 = firstCard.imageName.suffix(2)
        let secondCardLast2 = secondCard.imageName.suffix(2)
        
        //if firstCard.imageName == secondCard.imageName
        if (firstCardLast1 == secondCardLast1 && firstCardLength == secondCardLength) || (firstCardLast2 == secondCardLast2 && firstCardLength == secondCardLength) {
            
            firstCard.isFlipped = true
            secondCard.isFlipped = true
            
            firstCard.isMatched = true
            secondCard.isMatched = true
            
            cardOneCell?.fadeOutCard()
            cardTwoCell?.fadeOutCard()
            
            //Check if there are any cards left
            checkGameEnded()
            
        } else {
            
            firstCard.isFlipped = false
            secondCard.isFlipped = false
            
            cardOneCell?.flipImageBack()
            cardTwoCell?.flipImageBack()
            
        }
        
        if cardOneCell == nil {
            
            myCollectionView.reloadItems(at: [firstFlippedCardIndex!])
        }
        
        //enable it to use it again
        firstFlippedCardIndex = nil
    }
    
    
    func checkGameEnded() {
        
        var isWon = true
        
        for card in coolCardArray {
            
            if card.isMatched == false{
                isWon = false
                break
            }
        }
        
        if isWon == true {
            performSegue(withIdentifier: "win", sender: nil)
            print("User has won")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       // let yourWidth = collectionView.bounds.width/3.0
        //let yourHeight = yourWidth

        //return CGSize(width: yourWidth, height: yourHeight)
        
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth              = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth                   = availableWidth / 3
        
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout.itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth              = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth                   = availableWidth / 3
        
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout.sectionInset
        
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "win"{
            let vistaGanar = segue.destination as! NinthViewController
        }
    }
    
    
}
