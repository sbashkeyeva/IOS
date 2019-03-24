//
//  Contact.swift
//  GetContact
//
//  Created by Symbat Bashkeyeva on 3/5/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation

enum TagColor : Int, CaseIterable{
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
class Contact: NSObject, NSCoding {
    
    
    
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
    func encode(with aCoder: NSCoder) {
    aCoder.encode(self.firstname, forKey: "firstname")
    aCoder.encode(self.lastname,forKey: "lastname")
    aCoder.encode(self.phone,forKey: "phone")
    aCoder.encode(self.tagColor,forKey: "tag")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.firstname=aDecoder.decodeObject(forKey: "firstname") as? String ?? ""
        self.lastname=aDecoder.decodeObject(forKey: "lastname") as? String ?? ""
        self.phone=aDecoder.decodeObject(forKey: "phone") as? String ?? ""
        self.tagColor=aDecoder.decodeObject(forKey: "tag") as? TagColor ?? .blue
//        self.init(firstname:firstname, lastname:lastname, phone:phone, tagColor:tag)
    }
    
    
    
   
   
//        for index in 0..<firstname.count{
//            let contact=Contact(firstname: firstname[index], lastname: lastname[index], phone: phone[index], tagColor: tag as! TagColor )
//            contacts.append(contact)
//        }
//        for index in 0..<firstname.count {
//            let contact=Contact(firstname: firstname[index], lastname: lastname[index], phone: phone[index], tagColor: tagColor[index])
//        }
    
}
