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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func xobutton(_ sender: UIButton) {
        let change = Bool.random()
        if (change) {
            sender.setImage(UIImage(named: "mark-o"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "mark-x"), for: .normal)
        }
        print(sender.tag)
        titleLabel.text = "test"
        p1Label.text = "test"
        p2Label.text = "test"
        statusLabel.text = "test"
    }
    
    @IBAction func clearBoard(_ sender: Any) {
        for button in boardButtons {
            button.setImage(UIImage(named: "mark-none"), for: .normal)
        }
    }
    
}

