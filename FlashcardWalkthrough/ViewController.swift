//
//  ViewController.swift
//  FlashcardWalkthrough
//
//  Created by Eric Sowell on 7/5/14.
//  Copyright (c) 2014 EricSowell.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardLabel: UILabel
    
    let cards: Array<Card> = [
        Card(front: "τόξον, τό", back: "bow"),
        Card(front: "μνηστήρ, ὁ", back: "suitor"),
        Card(front: "κλίμαξ, ἡ", back: "ladder")
    ]
    
    var currentCard = 0
    var showFront = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showCard()
    }

    @IBAction func nextTapped(sender: AnyObject) {
        self.currentCard++
        self.showFront = true
        
        if (self.currentCard >= self.cards.count) {
            self.currentCard = self.cards.count - 1
        }
        
        showCard()
    }
    
    @IBAction func backTapped(sender: AnyObject) {
        self.currentCard--
        self.showFront = true
        
        if (self.currentCard < 0) {
            self.currentCard = 0
        }
        
        showCard()
    }
    
    @IBAction func flipCardTapped(sender: AnyObject) {
        if (self.showFront) {
            self.showFront = false
        }
        else {
            self.showFront = true
        }
        showCard()
    }
    
    func showCard() {
        if (self.showFront) {
            self.cardLabel.text = self.cards[self.currentCard].front
        }
        else {
            self.cardLabel.text = self.cards[self.currentCard].back
        }
    }
}

