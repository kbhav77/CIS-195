//
//  DViewController.swift
//  app4_bhavnani_krish
//
//  Created by Krish Bhavnani on 10/22/20.
//  Copyright © 2020 Krish Bhavnani. All rights reserved.
//

import UIKit

class DViewController: UIViewController {
    var first : String = ""
    var last : String = ""
    var company : String = ""
    var email : String = ""
    var number : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = first + " " + last
        companyLabel.text = company
        emailLabel.text = email
        phoneLabel.text = number

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
