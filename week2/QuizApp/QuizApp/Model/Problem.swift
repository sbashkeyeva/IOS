//
//  Problem.swift
//  QuizApp
//
//  Created by Symbat Bashkeyeva on 2/25/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation

enum Answer {
    case A
    case B
    case C
    case D
}

class Problem {
    var problemText: String
    var answer:Answer
    var variantA:String
    var variantB: String
    var variantC:String
    var variantD:String
    init(problemText:String,variantA:String, variantB:String,variantC:String, variantD:String, answer:Answer) {
        self.problemText=problemText
        self.answer=answer
        self.variantA=variantA
        self.variantB=variantB
        self.variantC=variantC
        self.variantD=variantD
    }
    
}
