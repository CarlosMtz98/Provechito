//
//  RecipeDetailsViewController.swift
//  Provechito
//
//  Created by Carlos Martínez Rodríguez on 28/05/21.
//

import UIKit

class RecipeViewController: UIViewController {
    var ingredientsList = [Ingredient]()
    
    @IBOutlet weak var recipeHeaderImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeDuration: UILabel!
    @IBOutlet weak var recipePrice: UILabel!
    @IBOutlet weak var recipeScore: UILabel!
    @IBOutlet weak var startRecipe: UIButton!
    @IBOutlet weak var recipeCategory: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchIngredientsData()
    }
    
    func initialize(recipe: Recipe, img: UIImage) {
        recipeHeaderImage.image = img
        
    }
    
    func fetchIngredientsData() {
        ingredientsList.append(Ingredient(id: "1", title: "150 gramos de harina"))
        ingredientsList.append(Ingredient(id: "2", title: "3 huevos"))
        ingredientsList.append(Ingredient(id: "3", title: "Cullarada de vainilla"))
        ingredientsList.append(Ingredient(id: "4", title: "1 barra de chocolate"))
        ingredientsList.append(Ingredient(id: "5", title: "50 gramos de mantequilla"))
    }
}
