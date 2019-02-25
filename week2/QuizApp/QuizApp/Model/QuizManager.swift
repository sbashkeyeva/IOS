//
//  QuizManager.swift
//  QuizApp
//
//  Created by Symbat Bashkeyeva on 2/25/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation


class QuizManager {
    var problems=ProblemGenerator.getQuizProblem()
    var currentIndex=0
    var score=0
    func getCurrentProblem() -> Problem{
        return problems[currentIndex]
    }
}
