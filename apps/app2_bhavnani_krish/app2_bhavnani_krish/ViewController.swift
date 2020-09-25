//
//  ViewController.swift
//  app2_bhavnani_krish
//
//  Created by Krish Bhavnani on 9/18/20.
//  Copyright © 2020 Krish Bhavnani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var p1Label: UILabel!
    
    @IBOutlet weak var p2Label: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet var boardButtons: Array<UIButton>!
    
    var p1Score = 0
    
    var p2Score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func xobutton(_ sender: UIButton) {
        if (active) {
            //Find coords of circle pressed
            let tag = sender.tag
            let xCoord = tag / 3
            let yCoord = tag % 3
            
            //Check who's turn it is and play the move if the move is valid
            if turn {
                if (update(xCoord, yCoord, "X")) {
                    sender.setImage(UIImage(named: "mark-x"), for: .normal)
                }
            } else {
                if (update(xCoord, yCoord, "O")) {
                    sender.setImage(UIImage(named: "mark-o"), for: .normal)
                }
            }
            
            //Update status label
            let result = checkWin()
                switch result {
                    case "topRow":
                        if !turn {
                            statusLabel.text = "Player 1 wins"
                            p1Score += 1;
                            p1Label.text = "Player 1's Score: \(p1Score)"
                        } else {
                            statusLabel.text = "Player 2 wins"
                            p2Score += 1;
                            p2Label.text = "Player 2's Score: \(p2Score)"
                        }
                        shade([0,1,2], "yellow")
                        active = false
                        statusLabel.textColor = UIColor.green
                    case "midRow":
                        if !turn {
                            statusLabel.text = "Player 1 wins"
                            p1Score += 1;
                            p1Label.text = "Player 1's Score: \(p1Score)"
                        } else {
                            statusLabel.text = "Player 2 wins"
                            p2Score += 1;
                            p2Label.text = "Player 2's Score: \(p2Score)"
                        }
                        shade([3,4,5], "yellow")
                        active = false
                        statusLabel.textColor = UIColor.green
                    case "botRow":
                        if !turn {
                            statusLabel.text = "Player 1 wins"
                            p1Score += 1;
                            p1Label.text = "Player 1's Score: \(p1Score)"
                        } else {
                            statusLabel.text = "Player 2 wins"
                            p2Score += 1;
                            p2Label.text = "Player 2's Score: \(p2Score)"
                        }
                        shade([6,7,8], "yellow")
                        active = false
                        statusLabel.textColor = UIColor.green
                    case "rightCol":
                        if !turn {
                            statusLabel.text = "Player 1 wins"
                            p1Score += 1;
                            p1Label.text = "Player 1's Score: \(p1Score)"
                        } else {
                            statusLabel.text = "Player 2 wins"
                            p2Score += 1;
                            p2Label.text = "Player 2's Score: \(p2Score)"
                        }
                        shade([0,3,6], "yellow")
                        active = false
                        statusLabel.textColor = UIColor.green
                    case "midCol":
                        if !turn {
                            statusLabel.text = "Player 1 wins"
                            p1Score += 1;
                            p1Label.text = "Player 1's Score: \(p1Score)"
                        } else {
                            statusLabel.text = "Player 2 wins"
                            p2Score += 1;
                            p2Label.text = "Player 2's Score: \(p2Score)"
                        }
                        shade([1, 4, 7], "yellow")
                        active = false
                        statusLabel.textColor = UIColor.green
                    case "leftCol":
                        if !turn {
                            statusLabel.text = "Player 1 wins"
                            p1Score += 1;
                            p1Label.text = "Player 1's Score: \(p1Score)"
                        } else {
                            statusLabel.text = "Player 2 wins"
                            p2Score += 1;
                            p2Label.text = "Player 2's Score: \(p2Score)"
                        }
                        shade([2, 5, 8], "yellow")
                        active = false
                        statusLabel.textColor = UIColor.green
                    case "negDiag":
                        if !turn {
                            statusLabel.text = "Player 1 wins"
                            p1Score += 1;
                            p1Label.text = "Player 1's Score: \(p1Score)"
                        } else {
                            statusLabel.text = "Player 2 wins"
                            p2Score += 1;
                            p2Label.text = "Player 2's Score: \(p2Score)"
                        }
                        shade([0,4,8], "yellow")
                        active = false
                        statusLabel.textColor = UIColor.green
                    case "posDiag":
                        if !turn {
                            statusLabel.text = "Player 1 wins"
                            p1Score += 1;
                            p1Label.text = "Player 1's Score: \(p1Score)"
                        } else {
                            statusLabel.text = "Player 2 wins"
                            p2Score += 1;
                            p2Label.text = "Player 2's Score: \(p2Score)"
                        }
                        shade([2,4,6], "yellow")
                        active = false
                        statusLabel.textColor = UIColor.green
                    default:
                        
                        if turn {
                            statusLabel.text = "Player 1's Turn"
                        } else {
                            statusLabel.text = "Player 2's Turn"
                        }
                }
            if  (result == "Full") {
                statusLabel.text = "Draw"
                shade([0,1,2,3,4,5,6,7,8], "gray")
                active = false
            }
            
        }
        
    }
        
    
    @IBAction func clearBoard(_ sender: Any) {
        for button in boardButtons {
            button.setImage(UIImage(named: "mark-none"), for: .normal)
        }
        resetBoard()
        statusLabel.text = "Player 1's Turn"
        statusLabel.textColor = UIColor.black
        turn = true
        active = true
    }
    
    func shade(_ blocks: [Int], _ color : String) {
        if (color == "gray") {
            for x in blocks {
                var buttonImage = UIImage(named: "mark-o")?.withRenderingMode(.alwaysTemplate)
                if (board[x / 3][x %  3] == "X") {
                    buttonImage = UIImage(named: "mark-x")?.withRenderingMode(.alwaysTemplate)
                }
                for button in boardButtons {
                    if (button.tag == x) {
                        button.setImage(buttonImage, for: .normal)
                        button.tintColor = .systemGray
                    }
                }
                
            }
        } else {
            for x in blocks {
                var buttonImage = UIImage(named: "mark-o")?.withRenderingMode(.alwaysTemplate)
                if (board[x / 3][x %  3] == "X") {
                    buttonImage = UIImage(named: "mark-x")?.withRenderingMode(.alwaysTemplate)
                }
                for button in boardButtons {
                    if (button.tag == x) {
                        button.setImage(buttonImage, for: .normal)
                        button.tintColor = .systemYellow
                    }
                }
            }
        }
        
    }
    
}


//Model
var board = [[Character]](repeating: [Character](repeating: "U", count: 3), count: 3)

//True = player 1's turn
var turn = true

var active = true

func resetBoard() {
    for x in 0...2 {
        board[x] = ["U", "U", "U"]
    }
}

func checkPos(_ x: Int, _ y: Int) -> Bool {
    if (board[x][y] == "U") {
        return true
    }
    return false
}

func update(_ x: Int, _ y: Int, _ s: Character) -> Bool {
    if checkPos(x, y){
        board[x][y] = s
        turn = !turn
        return true
    }
    return false
}

func checkWin() -> String{
    if (board[0][0] == board[0][1] && board[0][1] == board[0][2] && board[0][0] != "U") {
        return "topRow"
    }
    if (board[1][0] == board[1][1] && board[1][1] == board[1][2] && board[1][0] != "U") {
        return "midRow"
    }
    if (board[2][0] == board[2][1] && board[2][1] == board[2][2] && board[2][0] != "U") {
        return "botRow"
    }
    if (board[0][0] == board[1][0] && board[1][0] == board[2][0] && board[0][0] != "U") {
        return "rightCol"
    }
    if (board[0][1] == board[1][1] && board[1][1] == board[2][1] && board[0][1] != "U") {
        return "midCol"
    }
    if (board[0][2] == board[1][2] && board[1][2] == board[2][2] && board[0][2] != "U") {
        return "leftCol"
    }
    if (board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != "U") {
        return "negDiag"
    }
    if (board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != "U") {
        return "posDiag"
    }
    for row in 0...2 {
        for col in 0...2 {
            if board[row][col] == "U" {
                return "No"
            }
        }
    }
    
    return "Full"
    
}



