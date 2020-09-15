//
//  ViewController.swift
//  challenge 2
//
//  Created by Kristoffer Eriksson on 2020-09-15.
//  Copyright © 2020 Kristoffer Eriksson. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var allItems = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(resetItems))
        
        resetItems()
    }
    
    @objc func resetItems(){
        title = "ShoppingList"
        allItems.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = allItems[indexPath.row]
        return cell
    }
    
    @objc func promptForItem(){
        let ac = UIAlertController(title: "Enter item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitItem = UIAlertAction(title: "submit", style: .default){
            [weak self, weak ac] action in
            guard let item = ac?.textFields?[0].text else {return}
            self?.submit(item)
        }
        ac.addAction(submitItem)
        present(ac, animated: true)
    }
    
    func submit (_ item: String) {
        let item = item.lowercased()
        allItems.insert(item, at: 0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
        return
        
    }

}

