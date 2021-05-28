//
//  RecipeCollectionViewCell.swift
//  Provechito
//
//  Created by Carlos Martínez Rodríguez on 25/05/21.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImageThumbnail: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeDuration: UILabel!
    @IBOutlet weak var recipeCategory: UILabel!
    @IBOutlet weak var recipeLike: UIButton!
}
