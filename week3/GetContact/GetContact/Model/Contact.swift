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
class Contact{
    
    let defaults = UserDefaults.standard
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
    static func save(_ contacts: [Contact]){
        let defaults = UserDefaults.standard
        var firstnames=[String]()
        var lastnames=[String]()
        var phones=[String]()
        var tagColors=[TagColor]()
        for contact in contacts {
            firstnames.append(contact.firstname)
            lastnames.append(contact.lastname)
            phones.append(contact.phone)
            tagColors.append(contact.tagColor)
        }
        defaults.set(firstnames, forKey: "firstnames")
        defaults.set(lastnames, forKey: "lastnames")
        defaults.set(phones, forKey: "phones")
        defaults.set(tagColors, forKey: "tags")
    }
    static func oneSave(contact: Contact){
        var contacts=Contact.get()
        contacts.append(contact)
        Contact.save(contacts)
    }
    static func get() -> [Contact]{
        var contacts=[Contact]()
        let defaults = UserDefaults.standard
        let firstname=defaults.stringArray(forKey: "firstnames") ?? [String]()
        let lastname=defaults.stringArray(forKey: "lastnames") ?? [String]()
        let phone=defaults.stringArray(forKey: "phones") ?? [String]()
        let tag = defaults.object(forKey: "tags")
//        for index in 0..<firstname.count{
//            let contact=Contact(firstname: firstname[index], lastname: lastname[index], phone: phone[index], tagColor: tag as! TagColor )
//            contacts.append(contact)
//        }
//        for index in 0..<firstname.count {
//            let contact=Contact(firstname: firstname[index], lastname: lastname[index], phone: phone[index], tagColor: tagColor[index])
//        }
        return contacts
    }
}
