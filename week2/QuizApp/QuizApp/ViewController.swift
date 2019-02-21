//
//  ViewController.swift
//  QuizApp
//
//  Created by Symbat Bashkeyeva on 2/20/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let allQuestions=QuestionBank()
    var pickedAnswer:Bool=false
    var questionNumber:Int=0
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag==1 {
            pickedAnswer=true
        }
        else if sender.tag==2{
            pickedAnswer=false
        }
        checkAnswer()
        questionNumber+=1
        questionLabel.text=allQuestions.list[questionNumber].questionText
    }
    
    func checkAnswer() {
        let correctAnswer=allQuestions.list[questionNumber].answer
        if correctAnswer==pickedAnswer{
            print("You got it")
        }
        else{
            print("Wrong")
        }
        
        
    }

}

