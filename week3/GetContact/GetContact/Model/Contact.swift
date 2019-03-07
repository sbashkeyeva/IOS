//
//  Contact.swift
//  GetContact
//
//  Created by Symbat Bashkeyeva on 3/5/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation

class Contact{
    enum TagColor : CaseIterable{
        case red
        case blue
        case yellow
        case green
        case orange
        static let allValues = [red, blue, yellow, green, orange]
        init?(index :Int){
            switch index {
            case 1:
                self = .red
            case 2:
                self = .blue
            case 3:
                self = .yellow
            case 4:
                self = .green
            case 5:
                self = .orange
            default:
                return nil
            }
        }
    }
    var firstname:String
    var lastname:String
    var phone:String
    var tagColor:TagColor
    init(firstname:String, lastname:String,phone:String, tagColor:TagColor ) {
        self.firstname=firstname
        self.lastname=lastname
        self.phone=phone
        self.tagColor=tagColor
    }
}
