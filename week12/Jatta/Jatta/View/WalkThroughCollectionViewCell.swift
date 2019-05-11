//
//  WalkThroughCollectionViewCell.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 4/18/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit
import FirebaseStorage
import Kingfisher

class WalkThroughCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageWalkThrough: UIImageView!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cntView: UIView!
    
    func setWord(_ card:Card){
        let imageName=NSUUID().uuidString
        let storageRef=Storage.storage().reference().child("\(imageName).png")
        print(imageName)
        titleLabel.text=card.initialWord
        subTitleLabel.text=card.finalWord
        print(card.image)

        // HERHERHEHREHREHRHERHEHREHRHERHEHREHRHERHEHRHERHEHRHERHEHRHER
        let url = URL(string: card.image!)
        imageWalkThrough.kf.setImage(with: url)
//        imageWalkThrough.setImage(from: URL(string: card.image!)!)

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        DispatchQueue.main.async {
            self.cntView.layer.cornerRadius = 13.0
            self.cntView.layer.shadowColor=UIColor.cyan.cgColor
            self.cntView.layer.shadowOpacity=0.5
            self.cntView.layer.shadowOpacity=10.0
            self.cntView.layer.shadowOffset = .zero
            self.cntView.layer.shadowPath=UIBezierPath(rect: self.cntView.bounds).cgPath
            self.cntView.layer.shouldRasterize=true
        }
    }

}

extension UIImageView {
    func setImage(from url: URL, withPlaceholder placeholder: UIImage? = nil) {
        
        if (self.image != nil) {
            return
        }
        
        self.image = placeholder
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                let image = UIImage(data: data)
                
                print("image from " + url.absoluteString + " have been loaded")
                
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
}
