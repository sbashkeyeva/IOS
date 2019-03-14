//
//  PhotoService.swift
//  Flickr
//
//  Created by Symbat Bashkeyeva on 3/14/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PhotoService{
    static func getPhoto(success: @escaping ([Photo])->Void, failure: @escaping (Error)->Void  ){
        let url = URL.init(string: "https://api.flickr.com/services/rest/")
        var param=Parameters()
        param["method"]="flickr.photos.getRecent"
        param["api_key"]="e95c68bda6354323712d972796eb22b6"
        param["format"]="json"
        param["nojsoncallback"]="1"
        param["api_sig"] = "93606e3ed84e7805aee835073b7470cd"
        Alamofire.request(url!, parameters:param,headers:nil).responseJSON {
            response in
            switch response.result {
            case .success(let value):
                print(value)
                let photos=JSON(value)["photos"]["photo"].arrayValue
                
                var result=[Photo]()
                for json in photos{
                    result.append(Photo.init(json: json))
                }
                success(result)
            case .failure(let error):
                failure(error)
            }
            
            
        }
    }
    static func getPhotoInfo(_ photo_id: String,success: @escaping (PhotoInfo) -> Void, failure: @escaping (Error) -> Void ){
        let url = URL.init(string:"https://api.flickr.com/services/rest/")
        var param=Parameters()
        param["method"] = "flickr.photos.getInfo"
        param["api_key"] = "e95c68bda6354323712d972796eb22b6"
        param["photo_id"] = photo_id
        param["format"] = "json"
        param["nojsoncallback"] = "1"
    }
        
        
}
