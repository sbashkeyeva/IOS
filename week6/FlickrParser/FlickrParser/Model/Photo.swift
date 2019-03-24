//
//  Photo.swift
//  FlickrParser
//
//  Created by Symbat Bashkeyeva on 3/22/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
import SwiftyJSON

class Photo{
    var farm:String
    var title:String
    var ispublic:String
    var owner:String
    var server:String
    var id:String
    var isfamily:String
    var secret:String
    var isfriend:String
    var url:String
    init(json:JSON) {
        farm=json["farm"].stringValue
        title=json["title"].stringValue
        ispublic=json["ispublic"].stringValue
        owner=json["owner"].stringValue
        server=json["server"].stringValue
        id=json["id"].stringValue
        isfamily=json["isfamily"].stringValue
        secret=json["secret"].stringValue
        isfriend=json["isfriend"].stringValue
        url = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
    }
    
}
