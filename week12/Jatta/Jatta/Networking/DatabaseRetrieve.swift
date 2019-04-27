//
//  Database.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 4/25/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
import FirebaseDatabase


class DatabaseRetrieve{
    
    static func getData(completion: ((String)->())?) {
        
        var ref:DatabaseReference?
        var databaseHandle: DatabaseHandle?
        ref = Database.database().reference()
        databaseHandle=ref?.child("Words").observe(.childAdded, with: { (snapshot) in
            if let post=snapshot.value as? String {
                completion?(post)
            }
        })
        
    }
}
