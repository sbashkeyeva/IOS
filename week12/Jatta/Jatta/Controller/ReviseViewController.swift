//
//  ReviseViewController.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 5/28/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit
import Kingfisher
class ReviseViewController: UIViewController {
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    var pickedAnswer:Bool=false
    var correctAns:Problem.Answer=Problem.Answer.B
    var wrongAnswer:Int = 0
    var correctAnswer:Int = 0
    var str=""
     var manager = QuizManager()
    let wordsKey="wordsKey"
    var cards=[Card]()
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedSaved()
        problemLabel.numberOfLines=0
        showProblem()
        nextProblem()
        let closeButton = UIBarButtonItem.init(title: "Close", style: .done, target: self, action: #selector(closeTapped))
        navigationItem.rightBarButtonItem = closeButton
        
        // Do any additional setup after loading the view.
    }
    @objc func closeTapped(){
        dismiss(animated: true)
    }
    func selectedSaved(){
        guard let cardData = UserDefaults.standard.object(forKey: wordsKey) as? NSData else {
            print("'cards' not found in UserDefaults")
            return
        }
        
        // Пытаемся разархивировать полученные данные
        guard let cardsArray = NSKeyedUnarchiver.unarchiveObject(with: cardData as Data) as? [Card] else {
            print("Could not unarchive from cardData")
            return
        }
        // В случае успеха, если в архиве есть хотябы один контакт присваиваем массивву contacts данные кэшированного массива и обновляем tableView
        if cardsArray.count > 0 {
            cards=cardsArray
            //            tableView.reloadData()
        }
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
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
        aButton.backgroundColor = UIColor.white
        bButton.backgroundColor=UIColor.white
        cButton.backgroundColor=UIColor.white
        dButton.backgroundColor=UIColor.white
    }
    func checkAnswer(_ tag: Int) -> Bool{
        //        let correctAnswer=manager.getCurrentProblem().answer
        correctAns = manager.getCurrentProblem(cards: cards).answer
        print(correctAns)
        if tag==1{
            
            return manager.getCurrentProblem(cards: cards).answer==Problem.Answer.A
        }
        if tag==2{
            return manager.getCurrentProblem(cards: cards).answer==Problem.Answer.B
        }
        if tag==3{
            return manager.getCurrentProblem(cards: cards).answer==Problem.Answer.C
        }
        if  tag==4{
            return manager.getCurrentProblem(cards: cards).answer==Problem.Answer.D
        }
        
        return false
    }
    func showProblem(){
        
        let problem = manager.getCurrentProblem(cards: cards)
        problemLabel.text=problem.problemText
//        image.image=UIImage(named:problem.image)
        let url = URL(string: problem.image)
        image.kf.setImage(with: url)
        aButton.setTitle(problem.variantA, for: .normal)
        bButton.setTitle(problem.variantB, for: .normal)
        cButton.setTitle(problem.variantC, for: .normal)
        dButton.setTitle(problem.variantD, for: .normal)
        resetButtons()
        
    }
    func nextProblem(){
        if manager.currentIndex<(cards.count){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                self.showProblem()
                self.updateUI()
            })
            
        }else{
            manager.currentIndex=0
            print(correctAnswer)
            self.str=String(correctAnswer)
            print(str)
//            performSegue(withIdentifier: "final", sender: self)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "FinalViewController") as! FinalViewController
                vc.score=self.correctAnswer
                let nc = UINavigationController.init(rootViewController: vc)
                self.present(nc, animated: true)
            })
            
            
        }
        
    }
    func updateButton(correctAns:Problem.Answer, sender: UIButton){
        sender.backgroundColor=UIColor.green
    }
    func updateUI() {
        scoreLabel.text="Score: \(correctAnswer)"
        progressLabel.text="\(manager.currentIndex+1) / \(cards.count)"
        progressBar.frame.size.width=(view.frame.size.width/(13))*CGFloat(manager.currentIndex+1)
        
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
