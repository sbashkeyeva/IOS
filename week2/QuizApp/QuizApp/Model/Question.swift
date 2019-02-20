//
//  Question.swift
//  QuizApp
//
//  Created by Symbat Bashkeyeva on 2/21/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
class Question{
    let questionText:String
    let answer: Bool
    init(text:String, correctAnswer: Bool){
        questionText=text
        answer=correctAnswer
    }
}
