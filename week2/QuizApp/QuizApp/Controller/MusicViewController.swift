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
    var correctAns:Problem.Answer=Problem.Answer.B
    
    var manager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        problemLabel.numberOfLines=0
        showProblem()
        nextProblem()
        
        // Do any additional setup after loading the view.
    }
   
    @IBAction func answerPressed(_ sender: UIButton!) {
//        var btnsendertag:UIButton=sender
        
        if (checkAnswer(sender.tag)) {
            manager.score+=1
            sender.backgroundColor = UIColor.green
        } else {
            
            sender.backgroundColor = UIColor.red

        }
        switch correctAns {
        case Problem.Answer.A:
            updateButton(correctAns: .A, sender: aButton)
        case Problem.Answer.B:
            updateButton(correctAns: .B, sender: bButton)
        case Problem.Answer.C:
            updateButton(correctAns: .C, sender: cButton)
        case Problem.Answer.D:
            updateButton(correctAns: .D, sender: dButton)

        }
        
//
//        switch sender.tag {
//        case 1:
//            if (checkAnswer(sender.tag)){
//                sender.backgroundColor=UIColor.green
//            } else{
//                sender.backgroundColor=UIColor.red
//            }
//        case 2:
//            if (checkAnswer(sender.tag)){
//                sender.backgroundColor=UIColor.green
//            } else{
//                sender.backgroundColor=UIColor.red
//            }
//        case 3:
//            if (checkAnswer(sender.tag)){
//                sender.backgroundColor=UIColor.green
//            } else{
//                sender.backgroundColor=UIColor.red
//            }
//        case 4:
//            if (checkAnswer(sender.tag)){
//                sender.backgroundColor=UIColor.green
//            } else{
//                sender.backgroundColor=UIColor.red
//            }
//        default:
//            print("babe")
//        }
        manager.currentIndex+=1
       
        nextProblem()
    }
    func resetButtons() {
        aButton.backgroundColor = UIColor.white
    }
    func checkAnswer(_ tag: Int) -> Bool{
//        let correctAnswer=manager.getCurrentProblem().answer
        correctAns = manager.getCurrentProblem().answer
        print(correctAns)
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
        image.image=UIImage(named:problem.image)
       
        aButton.setTitle(problem.variantA, for: .normal)
        bButton.setTitle(problem.variantB, for: .normal)
        cButton.setTitle(problem.variantC, for: .normal)
        dButton.setTitle(problem.variantD, for: .normal)

    }
    func nextProblem(){
        if manager.currentIndex<=15{
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
                self.showProblem()
            })
            
            
        }else{
            manager.currentIndex=0
            let alert=UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            let restart=UIAlertAction(title: "Restart", style: .default, handler:{ (UIAlertAction) in
                self.restart()
            })
            alert.addAction(restart)
            present(alert,animated: true, completion: nil)
        }
        
    }
    func updateButton(correctAns:Problem.Answer, sender: UIButton){
        sender.backgroundColor=UIColor.green
//        aButton.backgroundColor=UIColor.yellow
//        bButton.backgroundColor=UIColor.yellow
//        cButton.backgroundColor=UIColor.yellow
//        dButton.backgroundColor=UIColor.yellow
    }
    func restart(){
        manager.currentIndex=0
        manager.score=0
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
