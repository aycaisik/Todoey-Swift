//
//  ViewController.swift
//  Todoey
//
//  Created by Ayça Işık on 23.07.2023.
//

import UIKit

class ToDoListViewController: UITableViewController{

    // MARK: - UI Elements
    
    // MARK: - Properties
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "find mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "buy eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "destroy"
        itemArray.append(newItem3)
        //if let items = defaults.array(forKey: "ToDoListArray") as? [String]{
          //  itemArray = items
        }
    
    
    // MARK: - Functions
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        if item.done == true {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //tableview delegate
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      // print(itemArray[indexPath.row])
       
       itemArray[indexPath.row].done = !itemArray[indexPath.row].done
       
      /* if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
       }else{
           tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
       }*/
      /* if itemArray[indexPath.row].done == false {   //bu kodlardan sonra hemen ust func bak..
           itemArray[indexPath.row].done = true
       }else{
           itemArray[indexPath.row].done = false
       }*/
       tableView.reloadData()
       tableView.deselectRow(at: indexPath, animated: true)//animated
   }
    
    
    // MARK: - Actions

    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()//bunu scope içindekine erişmek için oluşturduk
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default){(action) in
            //what will be happen when click the user add ıtem button on our uıalert...
           // print(textField.text)
            
            let newItem = Item()
            newItem.title = textField.text!
            
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray") //sadece bu kod yeterli degildir
            //didload icinde tableviewe göndermemız gerekır
            
            
            self.tableView.reloadData()
        }
        
        alert.addTextField{(alertTextField) in
            alertTextField.placeholder = "create new item"
      textField = alertTextField
            
            
            
        }
        alert.addAction(action)
        present(alert, animated: true,completion: nil)
        
    }
}


