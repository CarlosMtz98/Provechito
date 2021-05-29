//
//  CategoriesViewController.swift
//  Provechito
//
//  Created by Carlos Martínez Rodríguez on 27/05/21.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var arrCatgories = [Category]()
    var catImages = [String]()
    
    @IBOutlet weak var categoriesGridCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCategoryData()
        setupCollectionView()
    }
    
    private func fetchCategoryData() {
        catImages.append("https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        catImages.append("https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        catImages.append("https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=320&q=80")
        catImages.append("https://images.unsplash.com/photo-1458642849426-cfb724f15ef7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=320&q=80")
        catImages.append("https://images.unsplash.com/photo-1515942400420-2b98fed1f515?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80")
        catImages.append("https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=704&q=80")
        
        
        arrCatgories.append(Category(id:"1", name: "Comida mexicana", imageThumbnailUrl: catImages[0]))
        arrCatgories.append(Category(id:"2", name: "Desayunos", imageThumbnailUrl: catImages[1]))
        arrCatgories.append(Category(id:"3", name: "Italiana", imageThumbnailUrl: catImages[3]))
        arrCatgories.append(Category(id:"4", name: "Postres", imageThumbnailUrl: catImages[2]))
        arrCatgories.append(Category(id:"3", name: "Vegana", imageThumbnailUrl: catImages[4]))
        arrCatgories.append(Category(id:"4", name: "Bebidas", imageThumbnailUrl: catImages[5]))
    }
        
    private func setupCollectionView() {
        categoriesGridCollectionView.delegate = self
        categoriesGridCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        
        categoriesGridCollectionView.setCollectionViewLayout(layout, animated: true)
    }
}

extension CategoriesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCatgories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryGridCollectionViewCell
        cell.backgroundColor = .black
        cell.catCellImage.alpha = 0.7
        
        cell.catCellLabel.text = arrCatgories[indexPath.row].name
        let imageURL = URL(string: arrCatgories[indexPath.row].imageThumbnailUrl)
        
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: imageURL!)
            let image = UIImage(data: imageData!)
            
            DispatchQueue.main.async {
                cell.catCellImage.image = image
            }
        }
        
        return cell
    }
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        
        return CGSize(width: widthPerItem - 8, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = RecipesDetailViewController()
        vc.setUpView(navTitle: arrCatgories[indexPath.row].name)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
