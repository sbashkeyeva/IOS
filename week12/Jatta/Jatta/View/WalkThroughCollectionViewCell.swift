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
        titleLabel.text=card.initialWord
        subTitleLabel.text=card.finalWord
        let url = URL(string: card.image)
        imageWalkThrough.kf.setImage(with: url)

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
