//
//  Card.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 4/18/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
class Card: NSObject, NSCoding {
    var initialWord:String
    var finalWord:String
    var image:String
    
    init(initialWord:String, finalWord:String, image:String) {
        self.initialWord=initialWord
        self.finalWord=finalWord
        self.image=image
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(initialWord, forKey: "initialWord")
        aCoder.encode(finalWord, forKey: "finalWord")
        aCoder.encode(image, forKey: "image")
    }
    required convenience init(coder aDecoder: NSCoder) {
        let initialWord = aDecoder.decodeObject(forKey: "initialWord") as! String
        let finalWord = aDecoder.decodeObject(forKey: "finalWord") as! String
        let image = aDecoder.decodeObject(forKey: "image") as! String
        self.init(initialWord: initialWord, finalWord: finalWord, image: image)
    }
    
    
    
}
