//
//  FinalCollectionViewCell.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 5/16/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class FinalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var learnedLabel: UILabel!
    @IBOutlet weak var cntView: UIView!
    
    func setScore(wordcount:Int){
        learnedLabel.font = UIFont (name: "Helvetica Neue", size: 30)
        learnedLabel.text="You've learned \(wordcount) words!"
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
