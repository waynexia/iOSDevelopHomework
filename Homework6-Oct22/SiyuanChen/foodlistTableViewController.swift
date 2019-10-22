//
//  foodlistTableViewController.swift
//  chensiyuannew5
//
//  Created by apple on 2019/10/15.
//  Copyright © 2019 hzk. All rights reserved.
//

import UIKit

class foodlistTableViewController: UITableViewController {
    
    var foodList:[food]=[food]()
    
    func initFoodList(){
        loadFoodFile()
//        foodList.append(food(name:"apple",description_:"fruit"))
//        foodList.append(food(name:"pear",description_:"fruit"))
    }

    func loadFoodFile()->[food]?{
        return (NSKeyedUnarchiver.unarchiveObject(withFile: food.ArchiveURL.path)as?[food])
    }
    
    func saveFoodFile()
    {
        let success = NSKeyedArchiver.archiveRootObject(foodList, toFile:food.ArchiveURL.path)
        if success{
            print (food.ArchiveURL.path)
        }
        if !success{
            print("Failed ...")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let foodListFromFile=loadFoodFile() as? [food]{
            foodList = foodListFromFile
        }
        else{
            foodList.append(food(name:"apple",description_:"fruit"))
            foodList.append(food(name:"pear",description_:"fruit"))
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "foodCell",for:indexPath)
        
        cell.textLabel?.text=foodList[indexPath.row].name
        cell.detailTextLabel?.text=foodList[indexPath.row].description_
        return cell
    }

    @IBAction func cancelToList(segue:UIStoryboardSegue){
        
        print("this is 12321312")
    }
    
    @IBAction func saveToList(segue:UIStoryboardSegue){
        if let addFoodVC = segue.source as? descriptionViewController{
            print("this is 123")
            if let addFood=addFoodVC.foodForEdit{
                print("this is 456")
                if let selectedIndexPath=tableView.indexPathForSelectedRow{
                    foodList[(selectedIndexPath as NSIndexPath).row]=addFood
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                    
                    print("this is first if")
                    
                }
                else{
                    foodList.append(addFood)
                    let newIndexPath=IndexPath(row:foodList.count-1,section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                    
                    
                    print("this is secend if")
                }
                saveFoodFile()
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let descriptionVC=segue.destination as! descriptionViewController
        if let selectedCell=sender as? UITableViewCell{
            let indexPath=tableView.indexPath(for:selectedCell)!
            let selectedFood=foodList[(indexPath as NSIndexPath).row]
            descriptionVC.foodForEdit=selectedFood
        }
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            foodList.remove(at: indexPath.row)
            saveFoodFile()
            
            tableView.deleteRows(at: [indexPath],with: .fade)
        }
        else if editingStyle == .insert{
            
        }
    }
    
}
