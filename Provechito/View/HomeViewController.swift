//
//  HomeController.swift
//  Provechito
//
//  Created by Carlos Martínez Rodríguez on 23/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var recipeCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var recommendedCollectionView: UICollectionView!
    
    
    var arrRecipeItems = [Recipe]()
    var arrRecentRecipes = [Recipe]()
    var arrCategory = [Category]()
    var images = [String]()
    var catImages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images.append("https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        images.append("https://images.unsplash.com/photo-1516100882582-96c3a05fe590?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=320q=80")
        images.append("https://images.unsplash.com/photo-1599789197514-47270cd526b4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        
        catImages.append("https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        catImages.append("https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        catImages.append("https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=320&q=80")
        catImages.append("https://images.unsplash.com/photo-1458642849426-cfb724f15ef7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        
        
        arrRecipeItems.append(Recipe(id:"10", name: "Enchiladas verdes", duration: 45, category: "Comida mexicana", thumbnailUrl: images[0]))
        arrRecipeItems.append(Recipe(id:"11", name: "Pasta arrabiata", duration: 15, category: "Italiana", thumbnailUrl: images[1]))
        arrRecipeItems.append(Recipe(id:"14", name: "Chilaquiles", duration: 20, category: "Desayunos", thumbnailUrl: images[2]))
        
        arrCategory.append(Category(id:"1", name: "Comida mexicana", imageThumbnailUrl: catImages[0]))
        arrCategory.append(Category(id:"2", name: "Desayunos", imageThumbnailUrl: catImages[1]))
        arrCategory.append(Category(id:"3", name: "Italiana", imageThumbnailUrl: catImages[2]))
        arrCategory.append(Category(id:"4", name: "Postres", imageThumbnailUrl: catImages[3]))
        
        arrRecentRecipes.append(Recipe(id:"10", name: "Filete a la pimienta", duration: 45, category: "Plato fuerte", thumbnailUrl: images[0]))
        arrRecentRecipes.append(Recipe(id:"11", name: "Pasta arrabiata", duration: 15, category: "Italiana", thumbnailUrl: images[1]))
        arrRecentRecipes.append(Recipe(id:"14", name: "Chilaquiles", duration: 20, category: "Desayunos", thumbnailUrl: images[2]))
    }
}

extension HomeViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var count: Int = 0
        
        if collectionView == recipeCollectionView {
            count = arrRecipeItems.count
        }
        
        else if (collectionView == categoryCollectionView) {
            count = arrCategory.count
        }
        
        else if (collectionView == recommendedCollectionView) {
            count = arrRecentRecipes.count
        }
        
        
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == recipeCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCardCell", for: indexPath) as! RecipeCollectionViewCell
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
        
        else if (collectionView == categoryCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCardCell", for: indexPath) as! CategoryCollectionViewCell
            
            cell.categoryTitle.text = arrCategory[indexPath.row].name
            cell.categoryImageThumbnail.layer.cornerRadius = 8
            cell.categoryImageThumbnail.clipsToBounds = true
            let imageURL = URL(string: arrCategory[indexPath.row].imageThumbnailUrl)
            DispatchQueue.global().async {
                let imageData = try? Data(contentsOf: imageURL!)

                let image = UIImage(data: imageData!)
                DispatchQueue.main.async {
                    cell.categoryImageThumbnail.image = image
                }
            }
            return cell
        }
        
        else if (collectionView == recommendedCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCardCell", for: indexPath) as! RecipeCollectionViewCell
            cell.recipeName.text = arrRecentRecipes[indexPath.row].name
            cell.recipeDuration.text = String(arrRecentRecipes[indexPath.row].duration) + " min"
            cell.recipeCategory.text = arrRecentRecipes[indexPath.row].category
            
            cell.recipeImageThumbnail.layer.cornerRadius = 8
            cell.recipeImageThumbnail.clipsToBounds = true
            
            let imageURL = URL(string: arrRecentRecipes[indexPath.row].thumbnailUrl ?? "")
            DispatchQueue.global().async {
                let imageData = try? Data(contentsOf: imageURL!)

                let image = UIImage(data: imageData!)
                DispatchQueue.main.async {
                    cell.recipeImageThumbnail.image = image
                }
            }
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}
