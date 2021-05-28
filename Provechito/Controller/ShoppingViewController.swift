//
//  ShoppingViewController.swift
//  Provechito
//
//  Created by Javier Vargas on 28/05/21.
//

import UIKit

class ShoppingViewController: UIViewController {
    
    //Acá va el outlet del table view
    
    @IBOutlet weak var tableView: UITableView!
    
    var arr = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        arr.append("Uno")
        arr.append("Dos")
        arr.append("Tres")
        arr.append("Cuatro")
        arr.append("Cinco")
        arr.append("Seis")
    }
    

}


extension ShoppingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            self.arr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            completionHandler(true)
        }
        
        delete.image = UIImage(named: "trash")
        delete.backgroundColor = UIColor(red: 0.843, green: 0.200, blue: 0.251, alpha: 1)
        
        
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view, completionHandler) in
            print("edit")
            completionHandler(true)
        }
        
        edit.image = UIImage(named: "pencil")
        edit.backgroundColor = UIColor(red: 1, green: 0.796, blue: 0.361, alpha: 1)
        
        
        let swipe = UISwipeActionsConfiguration(actions: [edit])
        return swipe
    }
    
}
