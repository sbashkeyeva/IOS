//
//  Photo.swift
//  LastFlickr
//
//  Created by Symbat Bashkeyeva on 3/16/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
import SwiftyJSON
class Photo{
    var photo_id:String
    var owner:String
    var title:String
    var urlImage:String
    init(json:JSON) {
        photo_id=json["id"].stringValue
        owner=json["owner"].stringValue
        title=json["title"].stringValue
        let server=json["server"].stringValue
        let farm=json["farm"].stringValue
        let secret=json["secret"].stringValue
        urlImage="http://\(farm).statickflickr.com/\(server)/\(photo_id)_\(secret).jpg"
        
    }
    
}
