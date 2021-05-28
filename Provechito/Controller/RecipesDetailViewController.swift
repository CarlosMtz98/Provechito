//
//  RecipesDetailViewController.swift
//  Provechito
//
//  Created by Carlos Martínez Rodríguez on 28/05/21.
//

import UIKit

class RecipesDetailViewController: UIViewController {
    
    var arrRecipe = [Recipe]()
    var images = [String]()
    
    @IBOutlet weak var recipesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchRecipeData()
        
        recipesTableView.dataSource = self
        recipesTableView.delegate = self
        
        let nibName = UINib(nibName: "LargeRecipeCardTableViewCell", bundle: nil)
        recipesTableView.register(nibName, forCellReuseIdentifier: "recipeTableCell")
    }
    
    func setUpView(navTitle: String) {
        self.title = navTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func fetchRecipeData() {
        images.append("https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        images.append("https://images.unsplash.com/photo-1516100882582-96c3a05fe590?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=160q=80")
        images.append("https://images.unsplash.com/photo-1599789197514-47270cd526b4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        
        arrRecipe.append(Recipe(id:"10", name: "Enchiladas verdes", duration: 45, category: "Comida mexicana", thumbnailUrl: images[0], score: 4.3))
        arrRecipe.append(Recipe(id:"11", name: "Pasta arrabiata", duration: 15, category: "Italiana", thumbnailUrl: images[1], score: 3.2))
        arrRecipe.append(Recipe(id:"14", name: "Chilaquiles", duration: 20, category: "Desayunos", thumbnailUrl: images[2], score: 4.2))
    }
}

extension RecipesDetailViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 2.25
    }
}

extension RecipesDetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRecipe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeTableCell", for: indexPath) as! LargeRecipeCardTableViewCell
        
        cell.initialize(title: arrRecipe[indexPath.item].name, category: arrRecipe[indexPath.item].category, duration: arrRecipe[indexPath.item].duration, score: arrRecipe[indexPath.item].score ?? 1.0)
        
        let imageURL = URL(string: arrRecipe[indexPath.item].thumbnailUrl ?? "")
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: imageURL!)

            let image = UIImage(data: imageData!)
            DispatchQueue.main.async {
                cell.recipeCardImage.image = image
            }
        }
        
        return cell
    }    
}
