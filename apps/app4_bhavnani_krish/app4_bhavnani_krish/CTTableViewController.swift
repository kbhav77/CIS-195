//
//  CTTableViewController.swift
//  app4_bhavnani_krish
//
//  Created by Krish Bhavnani on 10/22/20.
//  Copyright © 2020 Krish Bhavnani. All rights reserved.
//

import UIKit

class CTTableViewController: UITableViewController, AddContactDelegate {
    
        
    var contacts = [Contact(firstName: "Krish", lastName: "Bhavnani", company: "UPenn", email: "ksb2@sas.upenn.edu", number: "7328508422"), Contact(firstName: "Jack", lastName: "Wright", company: "UPenn", email: "jackw@gmail.com", number: "7328459827")]
    
    var rowSelected = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func addSegue(_ sender: Any) {
        performSegue(withIdentifier: "add", sender: self)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "proto", for: indexPath)

        // Configure the cell...
        let name = contacts[indexPath.row].firstName + " " + contacts[indexPath.row].lastName

        cell.textLabel!.text = name

        cell.detailTextLabel!.text = "Person"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        rowSelected = indexPath.row
        performSegue(withIdentifier: "detail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detail"){
            let vc = segue.destination as! DViewController
            vc.first = contacts[rowSelected].firstName
            vc.last = contacts[rowSelected].lastName
            vc.company = contacts[rowSelected].company
            vc.email = contacts[rowSelected].email
            vc.number = contacts[rowSelected].number
        }
        if(segue.identifier == "add"){
            let vc = segue.destination as! UINavigationController
            let dest = vc.topViewController as! ACViewController
            dest.delegate = self
        }
        
    }
    
    func didCreate(_ contact: Contact) {
        dismiss(animated: true, completion: nil)
        contacts.append(contact)
        contacts = contacts.sorted { $0.lastName < $1.lastName }
        self.tableView.reloadData()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
