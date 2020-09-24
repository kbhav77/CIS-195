//
//  ViewController.swift
//  app0_bhavnani_krish
//
//  Created by Krish Bhavnani on 9/11/20.
//  Copyright © 2020 Krish Bhavnani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTxt: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeColor(_ sender: Any) {
        let color = labelTxt.text!
        if (color == "Blue") {
            labelTxt.text = "Red"
            labelTxt.textColor = UIColor.red
            button.setTitle("Turn Blue", for: .normal)
        } else {
            labelTxt.text = "Blue"
            labelTxt.textColor = UIColor.blue
            button.setTitle("Turn Red", for: .normal)

        }
    }
    
}

