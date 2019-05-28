//
//  QuizManager.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 5/28/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation

class QuizManager {
//    var problems=ProblemGenerator.getQuizProblem()
    var problems=[Problem]()
    var currentIndex=0
    var score=0
    func getCurrentProblem(cards:[Card]) -> Problem{
        print("card count: \(cards.count)")
        for card in cards{
            problems.append(Problem.init(image: card.image, problemText: "what's in the picture?", variantA: card.initialWord, variantB: "Yandex", variantC: "Lol", variantD: "Nothing", answer: .A))
        }
        print("problem count: \(problems.count)")
        return problems[currentIndex]
    }
}
