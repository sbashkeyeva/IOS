//
//  ProblemGenerator.swift
//  QuizApp
//
//  Created by Symbat Bashkeyeva on 2/25/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation

class ProblemGenerator {
    static func getQuizProblem() ->[Problem]{
        var problems=[Problem]()
        problems.append(Problem.init(problemText: "What is Symbat's favorite song?", variantA: "Thank u, next", variantB: "All of me", variantC: "Rise Up", variantD: "River", answer: .C))
        return problems
    }
}
