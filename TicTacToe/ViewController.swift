//
//  ViewController.swift
//  TicTacToe
//
//  Created by Utkarsh Pandey on 1/6/17.
//  Copyright © 2017 Utkarsh Pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var labelAgain: UIButton!
    
    @IBAction func buttonAgain(_ sender: Any) {
        
        activeGame = true
        activePlayer = 2
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        moves = 0
        
        for i in 1...9{
            if let button = view.viewWithTag(i) as? UIButton{
                
                button.setImage(nil, for: [])
            }
        }
        
        labelAgain.isHidden = true
        winLabel.isHidden = true
        winLabel.center = CGPoint(x: winLabel.center.x - 500, y: winLabel.center.y)
        labelAgain.center = CGPoint(x: labelAgain.center.x - 500, y: labelAgain.center.y)
        
    }
    var moves = 0
    
    var activeGame = true
    
    var activePlayer = 2 // 1 is noughts, 2 is crosses
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5 ,8], [0, 4, 8], [2, 4, 6]]
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        if gameState[sender.tag - 1] == 0 && activeGame {
            
            gameState[sender.tag - 1] = activePlayer
            
            if activePlayer == 1 {
                
                activePlayer = 2
                sender.setImage(UIImage(named: "nought.png"), for: [])
                moves += 1
                if let button = view.viewWithTag(sender.tag) as? UIButton{
                    
                    button.alpha = 0
                    UIView.animate(withDuration: 0.5, animations: {
                        button.alpha = 1
                    })
                }
                
                
            }
            else{
                
                activePlayer = 1
                sender.setImage(UIImage(named: "cross.png"), for: [])
                moves += 1
                if let button = view.viewWithTag(sender.tag) as? UIButton{
                    
                    button.alpha = 0
                    UIView.animate(withDuration: 0.5, animations: {
                        button.alpha = 1
                    })
                }
            }
        }
        if activeGame {
            for combos in winningCombos{
                
                if gameState[combos[0]] != 0 && gameState[combos[0]] == gameState[combos[1]] && gameState[combos[1]] == gameState[combos[2]]{
                    //Win
                    activeGame = false
                    winLabel.isHidden = false
                    labelAgain.isHidden = false
                    
                    if gameState[combos[0]] == 1 {
                        
                        winLabel.text = "Noughts has won!"
                        
                    } else {
                        
                        winLabel.text = "Crosses has won!"
                        
                    }
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.winLabel.center = CGPoint(x: self.winLabel.center.x + 500, y: self.self.winLabel.center.y)
                        self.labelAgain.center = CGPoint(x: self.winLabel.center.x + 500, y: self.labelAgain.center.y)
                    })
                }
            }
        }
        if activeGame && moves == 9{
            
            activeGame = false
            winLabel.isHidden = false
            labelAgain.isHidden = false
            winLabel.text = "It' a draw!"
            UIView.animate(withDuration: 1, animations: {
                
                self.winLabel.center = CGPoint(x: self.winLabel.center.x + 500, y: self.self.winLabel.center.y)
                self.labelAgain.center = CGPoint(x: self.winLabel.center.x + 500, y: self.labelAgain.center.y)
            })
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        labelAgain.isHidden = true
        winLabel.isHidden = true
        
        winLabel.center = CGPoint(x: winLabel.center.x - 500, y: winLabel.center.y)
        labelAgain.center = CGPoint(x: labelAgain.center.x - 500, y: labelAgain.center.y)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

