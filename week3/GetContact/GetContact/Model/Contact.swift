//
//  Contact.swift
//  GetContact
//
//  Created by Symbat Bashkeyeva on 3/5/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation

class Contact{
    enum TagColor{
        case red
        case blue
        case yellow
        case green
        case orange
    }
    var firstname:String
    var lastname:String
    var phone:String
    var tagColor:TagColor
    init(firsname:String, lastname:String,phone:String, tagColor:TagColor ) {
        self.firstname=firsname
        self.lastname=lastname
        self.phone=phone
        self.tagColor=tagColor
    }
}
