//
//  PhotoViewController.swift
//  FlickrParser
//
//  Created by Symbat Bashkeyeva on 3/25/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoViewController: UIViewController {

    @IBOutlet weak var photoImage: UIImageView!
    var photo:Photo?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let photo=photo, let url=URL(string: photo.url){
            photoImage.kf.setImage(with: url)

        // Do any additi onal setup after loading the view.
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
