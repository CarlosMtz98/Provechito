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
    var shuffledSequence = [Int]()
    
    @IBOutlet weak var recipesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchRecipeData()
        
        recipesTableView.dataSource = self
        recipesTableView.delegate = self
        
        let nibName = UINib(nibName: "LargeRecipeCardTableViewCell", bundle: nil)
        recipesTableView.register(nibName, forCellReuseIdentifier: "recipeTableCell")
        
        let sequence = 0 ..< arrRecipe.count
        shuffledSequence = sequence.shuffled()
    }
    
    func setUpView(navTitle: String) {
        self.title = navTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func fetchRecipeData() {
        images.append("https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        images.append("https://images.unsplash.com/photo-1600803907087-f56d462fd26b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=564&q=80")
        images.append("https://images.unsplash.com/photo-1599789197514-47270cd526b4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        images.append("https://images.unsplash.com/photo-1587339144367-f1cacbecac82?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80")
        images.append("https://images.unsplash.com/photo-1566740933430-b5e70b06d2d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1500&q=80")
        images.append("https://images.unsplash.com/photo-1515037893149-de7f840978e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=680&q=80")
        images.append("https://images.unsplash.com/photo-1610970881699-44a5587cabec?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80")
        images.append("https://images.unsplash.com/photo-1592663527359-cf6642f54cff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=722&q=80")
        images.append("https://images.unsplash.com/photo-1587248720327-8eb72564be1e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80")
        
        
        arrRecipe.append(Recipe(id:"10", name: "Enchiladas verdes", duration: 45, category: "Comida mexicana", thumbnailUrl: images[0], score: 4.3))
        arrRecipe.append(Recipe(id:"11", name: "Pasta arrabiata", duration: 15, category: "Italiana", thumbnailUrl: images[1], score: 3.2))
        arrRecipe.append(Recipe(id:"14", name: "Chilaquiles", duration: 20, category: "Desayunos", thumbnailUrl: images[2], score: 4.2))
        arrRecipe.append(Recipe(id:"16", name: "Hot cakes", duration: 25, category: "Desayunos", thumbnailUrl: images[3]))
        arrRecipe.append(Recipe(id:"18", name: "Burritos veganos", duration: 30, category: "Vegana", thumbnailUrl: images[4]))
        arrRecipe.append(Recipe(id:"20", name: "Brownies", duration: 45, category: "Postres", thumbnailUrl: images[5]))
        arrRecipe.append(Recipe(id:"22", name: "Jugo Verde", duration: 15, category: "Bebidas", thumbnailUrl: images[6]))
        arrRecipe.append(Recipe(id:"24", name: "Café Cold Brew", duration: 35, category: "Bebidas", thumbnailUrl: images[7]))
        arrRecipe.append(Recipe(id:"25", name: "Pie de Manzana", duration: 35, category: "Postres", thumbnailUrl: images[8]))
        
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
        
        let item = shuffledSequence[indexPath.item]
        
        
        cell.initialize(title: arrRecipe[item].name, category: arrRecipe[item].category, duration: arrRecipe[item].duration, score: arrRecipe[item].score ?? 1.0)
            
        let imageURL = URL(string: arrRecipe[item].thumbnailUrl ?? "")
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
