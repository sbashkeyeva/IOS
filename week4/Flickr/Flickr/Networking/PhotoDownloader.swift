//
//  PhotoDownloader.swift
//  Flickr
//
//  Created by Symbat Bashkeyeva on 3/14/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class PhotoDownloader{
    static func takePhoto(with url: String, completion: @escaping (UIImage) -> Void){
        Alamofire.request(url).responseImage { reponse in
            if let photo=reponse.result.value{
                completion(photo)
            }
        }
    }
}
