import UIKit

class NewsfeedTableViewController: UITableViewController {
    
    var newsItems = [NewsItem]()
    
    // MARK: IBAction
    @IBAction func didSelectAdd(_ sender: UIBarButtonItem) {
        
        let ac = UIAlertController(title: "Enter title", message: nil, preferredStyle: .alert)
        
        ac.addTextField()

        
        let doneAction = UIAlertAction(title: "Done", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0].text
            let item = NewsItem(title: answer!, favorite: false)
            self.newsItems.insert(item, at: 0)
            self.tableView.reloadData()
        }
        ac.addAction(doneAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
        }
        
        ac.addAction(cancelAction)
        
        present(ac, animated: true)

        

    }

    // MARK: - Basic table view methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: How many sections? (Hint: we have 1 section and x rows)
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Deque a cell from the table view and configure its UI. Set the label and star image by using cell.viewWithTag(..)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "proto", for: indexPath)
        
        
        if let label = cell.viewWithTag(1) as? UILabel {
            label.text = newsItems[indexPath.row].title
        }
        
        if let fav = cell.viewWithTag(2) as? UIImageView {
            if (newsItems[indexPath.row].favorite) {
                fav.image = UIImage(named: "star-filled")
            } else {
                fav.image = UIImage(named: "star-hollow")
            }
        }
        return cell
    }

    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    // MARK: - Handle user interaction
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:
        IndexPath) {
        // TODO: Deselect the cell, and toggle the "favorited" property in your model
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        newsItems[indexPath.row].favorite.toggle()
        if let fav = cell!.viewWithTag(2) as? UIImageView {
            if (newsItems[indexPath.row].favorite) {
                fav.image = UIImage(named: "star-filled")
            } else {
                fav.image = UIImage(named: "star-hollow")
            }
        }
        self.tableView.reloadData()
    }
    
    
    // MARK: - Swipe to delete functionality
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // TODO: If the editing style is deletion, remove the newsItem from your model and then delete the rows. CAUTION: make sure you aren't calling tableView.reloadData when you update your model -- calling both tableView.deleteRows and tableView.reloadData will make the app crash.
        
        if editingStyle == .delete {
            newsItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }

}

