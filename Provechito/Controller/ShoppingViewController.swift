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
    
    var arrProduct = [Product]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        initArray()
        
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "productCell")
    }
    
    func initArray(){
        arrProduct.append(Product(productName: "Queso", productCategory: "Lácteo", dateAdded: "27/05/2021"))
        arrProduct.append(Product(productName: "Lechuga", productCategory: "Verdura", dateAdded: "27/05/2021"))
        arrProduct.append(Product(productName: "Jitomate", productCategory: "Verdura", dateAdded: "27/05/2021"))
        arrProduct.append(Product(productName: "Yogurt", productCategory: "Lácteo", dateAdded: "27/05/2021"))
    }
    

}


extension ShoppingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProduct.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        75
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        cell.initialize(product: arrProduct[indexPath.item].productName, category: arrProduct[indexPath.item].productCategory, date: arrProduct[indexPath.item].dateAdded)
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            self.arrProduct.remove(at: indexPath.row)
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
