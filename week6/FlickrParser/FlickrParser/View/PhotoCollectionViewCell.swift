//
//  PhotoCollectionViewCell.swift
//  FlickrParser
//
//  Created by Symbat Bashkeyeva on 3/20/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    var imageURL:String?{
        didSet{
            if let imageURL=imageURL, let url=URL(string: imageURL){
                image.kf.setImage(with: url)
            }else{
                image.image=nil
                image.kf.cancelDownloadTask()
            }
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageURL=nil 
    }
    
}
