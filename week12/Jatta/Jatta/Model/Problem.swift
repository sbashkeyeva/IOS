//
//  Problem.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 5/28/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation

class Problem {
    enum Answer {
        case A
        case B
        case C
        case D
    }
    var problemText: String
    var answer:Answer
    var variantA:String
    var variantB: String
    var variantC:String
    var variantD:String
    var image:String
    init(image:String,problemText:String,variantA:String, variantB:String,variantC:String, variantD:String, answer:Answer) {
        self.image=image
        self.problemText=problemText
        self.answer=answer
        self.variantA=variantA
        self.variantB=variantB
        self.variantC=variantC
        self.variantD=variantD
    }
    
}
