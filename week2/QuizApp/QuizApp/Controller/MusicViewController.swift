//
//  MusicViewController.swift
//  QuizApp
//
//  Created by Symbat Bashkeyeva on 2/25/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    var pickedAnswer:Bool=false
    var correctAns:Problem.Answer=Problem.Answer.B
    var wrongAnswer:Int = 0
    var correctAnswer:Int = 0
    var str=""
    
    
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
            correctAnswer+=1
            sender.backgroundColor = UIColor.green
        } else {
            wrongAnswer+=1
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
//
        manager.currentIndex+=1
       
        nextProblem()
    }
    func resetButtons() {
        aButton.backgroundColor = UIColor.yellow
        bButton.backgroundColor=UIColor.yellow
        cButton.backgroundColor=UIColor.yellow
        dButton.backgroundColor=UIColor.yellow
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
        resetButtons()

    }
    func nextProblem(){
        if manager.currentIndex<=13{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
                self.showProblem()
                self.updateUI()
            })
            
        }else{
            manager.currentIndex=0
            print(correctAnswer)
            self.str=String(correctAnswer)
            print(str)
            performSegue(withIdentifier: "final", sender: self)
            
        }
        
    }
    func updateButton(correctAns:Problem.Answer, sender: UIButton){
        sender.backgroundColor=UIColor.green
    }
    func updateUI() {
        scoreLabel.text="Score: \(correctAnswer)"
        progressLabel.text="\(manager.currentIndex+1) /13"
        progressBar.frame.size.width=(view.frame.size.width/13)*CGFloat(manager.currentIndex+1)
        
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! FinalViewController
        vc.finalScore=self.str
    }

}
