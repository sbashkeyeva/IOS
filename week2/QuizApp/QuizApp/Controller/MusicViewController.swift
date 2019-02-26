//
//  MusicViewController.swift
//  QuizApp
//
//  Created by Symbat Bashkeyeva on 2/25/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    var pickedAnswer:Bool=false
    var problemNumber:Int=0
    var score:Int=0
    
    var manager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        problemLabel.numberOfLines=0
        showProblem()
        nextProblem()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func answerPressed(_ sender: UIButton!) {
        if (checkAnswer(sender.tag)) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
//        problemNumber+=1
        manager.currentIndex+=1
        nextProblem()
    }
    func checkAnswer(_ tag: Int) -> Bool{
//        let correctAnswer=manager.getCurrentProblem().answer
        if tag==1{
            return manager.getCurrentProblem().answer==Problem.Answer.A
        }
        if tag==2{
            return manager.getCurrentProblem().answer==Problem.Answer.B
        }
        if tag==3{
            return manager.getCurrentProblem().answer==Problem.Answer.C
        }
        if  tag==4{
            return manager.getCurrentProblem().answer==Problem.Answer.D
        }
        return false
    }
    func showProblem(){
        let problem = manager.getCurrentProblem()
        problemLabel.text=problem.problemText
        aButton.setTitle(problem.variantA, for: .normal)
        bButton.setTitle(problem.variantB, for: .normal)
        cButton.setTitle(problem.variantC, for: .normal)
        dButton.setTitle(problem.variantD, for: .normal)

    }
    func nextProblem(){
        showProblem()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
