//
//  TodoListTableViewController.swift
//  myApp3
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 newbee. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {

    var todoList: [todoItem] = [todoItem]()
    
    func initTodoList() {
        todoList.append(todoItem(title: "Say Hello", description: "say hello to tomorrow"))
        todoList.append(todoItem(title: "Say Goodbye", description: "say goodbye to yesterday"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        initTodoList()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = todoList[indexPath.row].title

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
        if let descriptionVC = segue.destination as? DescriptionViewController {
            if let selectedCell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: selectedCell)
                let selectedTodoItem = todoList[(indexPath! as NSIndexPath).row]
                descriptionVC.todoItemForEdit = selectedTodoItem
            }
        }
    }

    @IBAction func save(segue: UIStoryboardSegue) {
        if let addTodoVC = segue.source as? DescriptionViewController {
            if let addTodo = addTodoVC.todoItemForEdit {
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    todoList[(selectedIndexPath as NSIndexPath).row] = addTodo
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                } else {
                    todoList.append(addTodo)
                    let newIndexPath = IndexPath(row: todoList.count - 1, section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
        }
    }
    
    @IBAction func exit(segue: UIStoryboardSegue) {
        
    }
}
