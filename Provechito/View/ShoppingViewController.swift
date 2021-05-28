//
//  ShoppingViewController.swift
//  Provechito
//
//  Created by Javier Vargas on 28/05/21.
//

import UIKit

class ShoppingViewController: UIViewController {
    
    //Acá va el outlet del table view
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}


extension ShoppingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        15
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Item \(indexPath.row + 1)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            print("delete")
            completionHandler(true)
        }
        
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .red
        
        
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view, completionHandler) in
            print("edit")
            completionHandler(true)
        }
        
        edit.image = UIImage(systemName: "pencil")
        edit.backgroundColor = .yellow
        
        
        let swipe = UISwipeActionsConfiguration(actions: [edit])
        return swipe
    }
    
}
