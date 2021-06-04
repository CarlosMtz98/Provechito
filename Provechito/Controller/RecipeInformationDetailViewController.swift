//
//  RecipeInformationDetailController.swift
//  Provechito
//
//  Created by Zoe Caballero on 03/06/21.
//

import UIKit

class RecipeInformationDetailViewController: UIViewController {
    
    @IBOutlet weak var labelRecipeName: UILabel!
    @IBOutlet weak var imgRecipe: UIImageView!
    @IBOutlet weak var categoryRecipe: UILabel!
    var name = ""
    var category = ""
    var thumbnailUrl = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = UINib(nibName: "RecipeInformationDetail", bundle: nil)
        labelRecipeName.text = self.name
        categoryRecipe.text = self.category
        let imageURL = URL(string: self.thumbnailUrl)
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: imageURL!)

            let image = UIImage(data: imageData!)
            DispatchQueue.main.async {
                self.imgRecipe.image = image
            }
        }
    }

    func setUpView(navTitle: String, categoryRecipe: String, urlImage: String) {
        self.name = navTitle
        self.category = categoryRecipe
        self.thumbnailUrl = urlImage
    }


}
