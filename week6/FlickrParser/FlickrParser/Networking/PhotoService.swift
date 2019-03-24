//
//  PhotoService.swift
//  FlickrParser
//
//  Created by Symbat Bashkeyeva on 3/22/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import SVProgressHUD
class PhotoService {
    static func fetchFlickrPhotos(completion:(([Photo]?)->Void)? = nil){
        let url = URL(string: "https://api.flickr.com/services/rest/")!
        let parameters=[
            "method":"flickr.photos.getRecent",
            "api_key":"b757fd30e14e9f145ae5f60fbe68fd57",
            "format":"json",
            "nojsoncallback":"1",
            "api_sig":"3b380ec24e23ab9065df84412d2e63cf"
//            "per_page":"30",
//            "extras":"url_q,url_z"
        ]
        Alamofire.request(url, method: .get, parameters: parameters)
            .validate()
            .responseJSON(){
                (response) in
                switch response.result{
                case .success(let val):
//                    print("nu blya")
//                    print(val)
                    guard let data = response.data, let json=try? JSON(data: data) else {
                        print("Error while parsing response")
                        completion?(nil)
                        return
                    }
                    var photos=[Photo]()
                    let photosJSON=json["photos"]["photo"].arrayValue
                    for item in photosJSON{
                        photos.append(Photo.init(json: item))
                    }
                    completion?(photos)
//                    print(json)
                case .failure(let error):
                    print("Error is occuring while fetching photos \(error.localizedDescription)")
                    completion?(nil)
                }
        }
    }
}
