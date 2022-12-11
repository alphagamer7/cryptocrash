//
//  MyListTableViewController.swift
//  cryptocrash
//
//  Created by Athif on 2022/12/01.
//

import UIKit
import CoreData

class MyListTableViewController: UITableViewController {
    
    var CoreDataFetchObj = CoreDataFetch()
    //create the newArray to receive data array
    var newArray = [(cyname: String, cyimg: String, cyprice: String, cylow: String, cyhigh: String, cydate: String)]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fetch data from the core data and save
        CoreDataFetchObj.fetchData{
            newArray in
                self.newArray = newArray
        }
        
        self.tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mylistcell", for: indexPath) as! MyListTableViewCell
        
        //load data from the array fetching from the coredata
        cell.cryptoName.text! = newArray[indexPath.row].cyname
        
        let imgUri = newArray[indexPath.row].cyimg
        do{
            cell.cryptoImage.image = UIImage(data: try NSData(contentsOf: NSURL(string: imgUri)! as URL) as Data)
        }catch let error{
            print(error)
        }
        cell.low.text! = newArray[indexPath.row].cylow
        cell.high.text! = newArray[indexPath.row].cyhigh
        cell.price.text! = newArray[indexPath.row].cyprice
        cell.dateSt.text! = newArray[indexPath.row].cydate
        // Configure the cell...

        return cell
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


