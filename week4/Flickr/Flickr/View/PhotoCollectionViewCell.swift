//
//  PhotoCollectionViewCell.swift
//  Flickr
//
//  Created by Symbat Bashkeyeva on 3/14/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    func setValue( _ url:String){
        PhotoDownloader.takePhoto(with: url){
            photo in
            self.image.image=photo
        }
    }
}
