//
//  Photo.swift
//  Flickr
//
//  Created by Symbat Bashkeyeva on 3/14/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
import SwiftyJSON
class Photo{
    var id:String
    var url:String
    var title:String
    var owner:String
    init(json:JSON) {
        id=json["id"].stringValue
        let secret=json["secret"].stringValue
        let farm = json["farm"].stringValue
        let server=json["server"].stringValue
        url = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
        owner=json["owner"].stringValue
        title=json["title"].stringValue
    }
}
class PhotoInfo{
    var title:String
    var username:String
    var description:String
    var date:String
    var views:String
    init(json:JSON) {
        title=json["title"]["_content"].stringValue
        username=json["owner"]["username"].stringValue
        description=json["description"]["_content"].stringValue
        date=json["date"]["taken"].stringValue
        views=json["views"].stringValue
    }
}
