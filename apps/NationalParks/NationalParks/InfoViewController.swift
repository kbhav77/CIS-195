//
//  InfoViewController.swift
//  NationalParks
//
//  Created by Krish Bhavnani on 11/9/20.
//  Copyright © 2020 Krish Bhavnani. All rights reserved.
//

import UIKit
import Kingfisher

class InfoViewController: UIViewController {

    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var designationLabel: UILabel!
    
    @IBOutlet weak var descriptionField: UITextView!
    
    @IBOutlet weak var imageField: UIImageView!
    
    var name : String = ""
    var designation : String = ""
    var desc : String = ""
    var imageURL : URL? = nil
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameLabel.text = name
        designationLabel.text = designation
        descriptionField.text = desc
        if imageURL != nil {
            imageField.kf.setImage(with : imageURL)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
