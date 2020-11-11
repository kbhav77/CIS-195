//
//  NPTableViewController.swift
//  NationalParks
//
//  Created by Krish Bhavnani on 11/9/20.
//  Copyright © 2020 Krish Bhavnani. All rights reserved.
//

import UIKit
import Kingfisher

class NPTableViewController: UITableViewController {
    
    
    var parks = [NationalPark]()
    let endpoint = "https://developer.nps.gov/api/v1/parks?limit=30&api_key=YHrPCi0GIhJ1bieYYcJbbPTYoSC4sLY2BjYasWZK"

    var rowSelected = 0
    
    @IBAction func refreshNP(_ sender: UIRefreshControl) {
        sender.beginRefreshing()
        makeAPICall(sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshNP(refreshControl!)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    private func  makeAPICall(_ sender : UIRefreshControl) {
        let url = URL(string: endpoint)!
        let urlRequest = URLRequest(url: url)
        
        
        let task = URLSession.shared.dataTask(with: urlRequest){ (data,response,error) in
            guard let data = data, error == nil else{
                print("Error")
                return
            }
            if let APIResponse = try? JSONDecoder().decode(APIData.self, from: data){
                DispatchQueue.main.async{
                    self.parks = APIResponse.data
                    self.tableView.reloadData()
                    sender.endRefreshing()
                }
            }
        }
        task.resume()
        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return parks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "proto", for: indexPath)
        
        if let label = cell.viewWithTag(2) as? UILabel {
            label.text = parks[indexPath.row].fullName
        }
        if let label = cell.viewWithTag(3) as? UILabel {
            label.text = parks[indexPath.row].designation
        }
        if var label = cell.viewWithTag(1) as? UIImageView {
            dump(parks[indexPath.row])
            if (parks[indexPath.row].images.count != 0) {
                label.kf.setImage(with : parks[indexPath.row].images[0].url)
            } else {
                label.image = nil
            }
            
            
        }
        // Configure the cell...

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        rowSelected = indexPath.row
        performSegue(withIdentifier: "info", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "info"){
            let vc = segue.destination as! InfoViewController
            vc.name = parks[rowSelected].fullName
            vc.designation = parks[rowSelected].designation
            vc.desc = parks[rowSelected].description
            if (parks[rowSelected].images.count != 0) {
                vc.imageURL = parks[rowSelected].images[0].url
            } 
        }
        
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
