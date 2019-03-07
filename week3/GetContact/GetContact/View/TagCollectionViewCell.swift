//
//  TagCollectionViewCell.swift
//  GetContact
//
//  Created by Symbat Bashkeyeva on 3/6/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagButton: UIButton!
    func setTag(_ index: Int){
        tagButton.backgroundColor=UIColor.green
    }
    
}
