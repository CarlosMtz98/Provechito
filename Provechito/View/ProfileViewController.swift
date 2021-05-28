//
//  ProfileViewController.swift
//  Provechito
//
//  Created by Zoe Caballero on 25/05/21.
//

import UIKit

class ProfileViewController: UIViewController {
    

    
    @IBOutlet weak var svProfile: UIScrollView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var cvStatistics: UICollectionView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imgP:UIImage = UIImage(named: "gordon")!
        imgProfile.maskCircle(inputImage:imgP)
        
        
    }
    
    
}

extension ProfileViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCardCell", for: indexPath)
        return cell
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

class StatisticsCardCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
