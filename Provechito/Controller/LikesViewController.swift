//
//  LikesViewController.swift
//  Provechito
//
//  Created by Zoe Caballero on 28/05/21.
//

import UIKit

class LikesViewController: UIViewController {
    
    var arrRecipeItems = [Recipe]()
    var images = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images.append("https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        images.append("https://images.unsplash.com/photo-1516100882582-96c3a05fe590?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=320q=80")
        images.append("https://images.unsplash.com/photo-1599789197514-47270cd526b4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        
        arrRecipeItems.append(Recipe(id:"10", name: "Enchiladas verdes", duration: 45, category: "Comida mexicana", thumbnailUrl: images[0]))
        arrRecipeItems.append(Recipe(id:"11", name: "Pasta arrabiata", duration: 15, category: "Italiana", thumbnailUrl: images[1]))
        arrRecipeItems.append(Recipe(id:"14", name: "Chilaquiles", duration: 20, category: "Desayunos", thumbnailUrl: images[2]))
        
        
        
    }
}


extension LikesViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 1.5, height: collectionView.frame.width / 2.5)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrRecipeItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCardLikeCell", for: indexPath) as! RecipeCollectionViewCell
            cell.recipeName.text = arrRecipeItems[indexPath.row].name
            cell.recipeDuration.text = String(arrRecipeItems[indexPath.row].duration) + " min"
            cell.recipeCategory.text = arrRecipeItems[indexPath.row].category
            
            cell.recipeImageThumbnail.layer.cornerRadius = 8
            cell.recipeImageThumbnail.clipsToBounds = true
            
            let imageURL = URL(string: arrRecipeItems[indexPath.row].thumbnailUrl ?? "")
            DispatchQueue.global().async {
                let imageData = try? Data(contentsOf: imageURL!)
                let image = UIImage(data: imageData!)
                DispatchQueue.main.async {
                    cell.recipeImageThumbnail.image = image
                }
            }
            return cell
    }
}

