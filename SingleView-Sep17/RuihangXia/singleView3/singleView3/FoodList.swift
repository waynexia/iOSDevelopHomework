//
//  FoodList.swift
//  singleView3
//
//  Created by imac on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class FoodList: UITableViewController {
    
    var food_list : [food] = [food]()
    
    func initFoodList(){
        food_list.append(food(name:"name1",desc:"desc1",star: 3))
        food_list.append(food(name:"name2",desc:"desc2",star: 4))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initFoodList()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return food_list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = food_list[indexPath.row].name

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let detailVC = segue.destination as? DetailViewController{
            if let selectedCell = sender as? UITableViewCell{
                let indexPath = tableView.indexPath(for: selectedCell)!
                let selectedFood = food_list[(indexPath as NSIndexPath).row]
                detailVC.foodForEdit = selectedFood
            }
        }
        if let addVC = segue.destination as? EditViewController{
            addVC.edit = false
        }
    }
 
    
    @IBAction func exitToList(segue: UIStoryboardSegue){
        print("Back to list")
    }
    
    @IBAction func saveChange(segue: UIStoryboardSegue){
        if let editVC = segue.source as? EditViewController{
            if editVC.edit!{
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    // update an exissting food
                    food_list[(selectedIndexPath as NSIndexPath).row] = editVC.foodForEdit!
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }
            }
            else{
                print("going to add a entry")
                let addFood = editVC.foodForEdit!
                food_list.append(addFood)
                let newIndexPath = IndexPath(row:food_list.count - 1, section: 0)
                tableView.insertRows(at: [newIndexPath], with:.automatic)
            }
        }
    }
    

}
