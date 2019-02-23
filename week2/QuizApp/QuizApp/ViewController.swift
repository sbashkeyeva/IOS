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
//        let firstQuestion = allQuestions.list[0]
        questionLabel.numberOfLines=0
//        questionLabel.text = firstQuestion.questionText
        nextQuestion()
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
        nextQuestion()
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
    func nextQuestion(){
        if questionNumber<=12{
             questionLabel.text=allQuestions.list[questionNumber].questionText
        }else{
            questionNumber=0
            print("End of quiz")
            let alert=UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            let restartAction=UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert,animated: true, completion: nil)
//            let alert=UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
//            present(alert,animated: true, completion: nil)
            
        }
    }
    func startOver() {
        questionNumber=0
        nextQuestion()
    }
    

}

