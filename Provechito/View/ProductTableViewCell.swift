//
//  ProductTableViewCell.swift
//  Provechito
//
//  Created by Javier Vargas on 28/05/21.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var dateAdded: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initialize(product: String, category: String, date: String) {
        productName.text = product
        productCategory.text = category
        dateAdded.text = date
    }
    
}
