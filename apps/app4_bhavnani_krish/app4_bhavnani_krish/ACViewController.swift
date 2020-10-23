//
//  ACViewController.swift
//  app4_bhavnani_krish
//
//  Created by Krish Bhavnani on 10/22/20.
//  Copyright © 2020 Krish Bhavnani. All rights reserved.
//

import UIKit

protocol AddContactDelegate: class {
    func didCreate(_ contact: Contact)
}

class ACViewController: UIViewController {
    
    weak var delegate: AddContactDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelAdd(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAdd(_ sender: Any) {
        let newGuy = createNewContact()
        if (newGuy != nil){
            self.delegate?.didCreate(newGuy!)
        }
    }
    
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var company: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var number: UITextField!
    
    func createNewContact() -> Contact? {
        let fs = firstName.text!
        let ls = lastName.text!
        let cs = company.text!
        let es = email.text!
        let ns = number.text!
        if (fs == "" || ls == "" || cs == "" || es == "" || ns == "") {
            return nil
        }
        var newContact = Contact(firstName: fs, lastName: ls, company: cs, email: es, number: ns)
        return newContact
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
