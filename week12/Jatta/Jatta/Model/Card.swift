//
//  Card.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 4/18/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
class Card{
    var initialWord:String
    var finalWord:String
    var typeWord:String
    var image:String
    init(initialWord:String, finalWord:String, typeWord:String, image:String) {
        self.initialWord=initialWord
        self.finalWord=finalWord
        self.typeWord=typeWord
        self.image=image
    }
}
