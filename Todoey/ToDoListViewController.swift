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
    
    let itemArray = ["find mike","buy eggos","destroy zort"]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
  //  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
  //  }
    
    
    // MARK: - Actions

}

