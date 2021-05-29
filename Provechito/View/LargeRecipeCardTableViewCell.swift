//
//  LargeRecipeCardTableViewCell.swift
//  Provechito
//
//  Created by Carlos Martínez Rodríguez on 28/05/21.
//

import UIKit

class LargeRecipeCardTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeCardImage: UIImageView!
    @IBOutlet weak var recipeCardTitle: UILabel!
    @IBOutlet weak var recipeCardCategory: UILabel!
    @IBOutlet weak var recipeDuration: UILabel!
    @IBOutlet weak var recipeScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        recipeCardImage.layer.cornerRadius = 8
        recipeCardImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initialize(title: String, category: String, duration: Int, score:Float) {
        recipeCardTitle.text = title
        recipeCardCategory.text = category
        recipeDuration.text = "\(duration) min"
        recipeScore.text = String(format: "%.1f", score)
    }
    
}
