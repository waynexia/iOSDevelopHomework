//
//  TableViewController.swift
//  HelloWorld
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 fengyuxiang. All rights reserved.
//

import UIKit

class FoodListController: UITableViewController {
    var foodList: [food] = [food]()

    func initFoodList(){
        foodList.append(food(foodName: "cake", foodDescription: "sweet"))
        foodList.append(food(foodName: "apple", foodDescription: "sweet"))
        foodList.append(food(foodName: "banana", foodDescription: "sweet"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if let fileFood = loadFoodFile() as? [food]{
            foodList = fileFood
        }
        else {
            initFoodList()
            saveFoodFile()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodList.count
    }
    
    override func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath)->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier:"foodCell", for: indexPath)
            cell.textLabel?.text = foodList[indexPath.row].foodName
            
            return cell
        }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            foodList.remove(at: indexPath.row)
            saveFoodFile()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

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
        if let descriptionVC = segue.destination as? FoodDescriptionViewController{
            if let selectedCell = sender as? UITableViewCell{
                let indexPath = tableView.indexPath(for: selectedCell)!
                let selectedFood = foodList[(indexPath as NSIndexPath).row]
                descriptionVC.foodForEdit = selectedFood
            }
        }
    }
    
    func saveFoodFile(){
        let success = NSKeyedArchiver.archiveRootObject(foodList, toFile: food.ArchiveURL.path)
        print(food.ArchiveURL.path)
        if !success {
            print("Failed to save food file!")
        }
    }
    
    func loadFoodFile() -> [food]?{
        return (NSKeyedUnarchiver.unarchiveObject(withFile: food.ArchiveURL.path) as? [food])
    }
    
    // 回退入口
    //
    @IBAction func cancelToList (segue: UIStoryboardSegue){
        
    }
    // 带数据返回
    @IBAction func saveToList(segue: UIStoryboardSegue){
        
        if let addFoodVC = segue.source as? FoodDescriptionViewController{
            if let newFood = addFoodVC.newFood{
                if(addFoodVC.newPage){
                    // append
                    foodList.append(newFood)
                    let newIndexPath = IndexPath(row: foodList.count-1, section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
                else{
                    if let selectedIndexPath = tableView.indexPathForSelectedRow{
                        // update
                        foodList[(selectedIndexPath as NSIndexPath).row] = newFood
                        tableView.reloadRows(at: [selectedIndexPath], with: .none)
                    }
                }
            }
            else{
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    // 旧列表项内容变为空，则删除该行
                    foodList.remove(at: (selectedIndexPath as NSIndexPath).row)
                    tableView.deleteRows(at: [selectedIndexPath], with: .none)
                }
                else{
                    // 创建了一个空的项， do nothing
                }
            }
        }
        saveFoodFile()
    }
}
