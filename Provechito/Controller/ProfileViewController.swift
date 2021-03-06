//
//  ProfileViewController.swift
//  Provechito
//
//  Created by Zoe Caballero on 25/05/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var collectionViewStatistics: UICollectionView!
    @IBOutlet weak var collectionViewRecipe: UICollectionView!
    
    var arrRecentRecipes = [Recipe]()
    var arrStatisticRecipes = [Statistic]()
    var images = [String]()
    var statImages = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imgP:UIImage = UIImage(named: "gordon")!
        imgProfile.maskCircle(inputImage:imgP)
        
        images.append("https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        images.append("https://images.unsplash.com/photo-1600803907087-f56d462fd26b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=564&q=80")
        images.append("https://images.unsplash.com/photo-1599789197514-47270cd526b4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        
        arrRecentRecipes.append(Recipe(id:"10", name: "Filete a la pimienta", duration: 45, category: "Plato fuerte", thumbnailUrl: images[0]))
        arrRecentRecipes.append(Recipe(id:"11", name: "Pasta arrabiata", duration: 15, category: "Italiana", thumbnailUrl: images[1]))
        arrRecentRecipes.append(Recipe(id:"14", name: "Chilaquiles", duration: 20, category: "Desayunos", thumbnailUrl: images[2]))
        
        statImages.append("https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1602&q=80")
        statImages.append("https://images.unsplash.com/photo-1526628953301-3e589a6a8b74?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1595&q=80")
        statImages.append("https://images.unsplash.com/photo-1591696205602-2f950c417cb9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80")
    
        arrStatisticRecipes.append(Statistic(id: "1", name: "Recetas realizadas", imageThumbnailUrl: statImages[0]))
        arrStatisticRecipes.append(Statistic(id: "2", name: "Horas cocinando", imageThumbnailUrl: statImages[1]))
        arrStatisticRecipes.append(Statistic(id: "3", name: "Recetas dominadas", imageThumbnailUrl: statImages[2]))
    }
    
    
}

extension ProfileViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var count: Int = 0
        
        if (collectionView == collectionViewRecipe) {
            count = arrRecentRecipes.count
        }else if (collectionView == collectionViewStatistics) {
            count = arrStatisticRecipes.count
        }
        
        
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == collectionViewRecipe) {
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
        }else if (collectionView == collectionViewStatistics) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCardCell", for: indexPath) as! CategoryCollectionViewCell
            
            cell.categoryTitle.text = arrStatisticRecipes[indexPath.row].name
            cell.categoryImageThumbnail.layer.cornerRadius = 8
            cell.categoryImageThumbnail.clipsToBounds = true
            let imageURL = URL(string: arrStatisticRecipes[indexPath.row].imageThumbnailUrl)
            DispatchQueue.global().async {
                let imageData = try? Data(contentsOf: imageURL!)

                let image = UIImage(data: imageData!)
                DispatchQueue.main.async {
                    cell.categoryImageThumbnail.image = image
                }
            }
            return cell
        }
        
        
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = RecipeInformationDetailViewController()
        vc.setUpView(navTitle: arrRecentRecipes[indexPath.row].name, categoryRecipe: arrRecentRecipes[indexPath.row].category, urlImage: arrRecentRecipes[indexPath.row].thumbnailUrl ?? "")
        self.navigationController?.pushViewController(vc, animated: true)
            
    }
}

extension UIImageView {
  public func maskCircle(inputImage: UIImage) {
    self.contentMode = UIView.ContentMode.scaleAspectFill
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.masksToBounds = false
    self.clipsToBounds = true

   self.image = inputImage
  }
}


