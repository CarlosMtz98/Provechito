//
//  SearchViewController.swift
//  Provechito
//
//  Created by Zoe Caballero on 28/05/21.
//

import UIKit


class SearchViewController: UIViewController {
    
    var arrCategory = [Category]()
    var catImages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catImages.append("https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        catImages.append("https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        catImages.append("https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=320&q=80")
        catImages.append("https://images.unsplash.com/photo-1458642849426-cfb724f15ef7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        
        arrCategory.append(Category(id:"1", name: "Comida mexicana", imageThumbnailUrl: catImages[0]))
        arrCategory.append(Category(id:"2", name: "Desayunos", imageThumbnailUrl: catImages[1]))
        arrCategory.append(Category(id:"3", name: "Italiana", imageThumbnailUrl: catImages[2]))
        arrCategory.append(Category(id:"4", name: "Postres", imageThumbnailUrl: catImages[3]))
        
        
    }
}

extension SearchViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = RecipesDetailViewController()
        vc.setUpView(navTitle: arrCategory[indexPath.row].name)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
    
