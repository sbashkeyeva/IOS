//
//  ChoiceViewController.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 5/9/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    @IBOutlet weak var reviseButton: UIButton!
    @IBOutlet weak var learnButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        styledButtons()
        // Do any additional setup after loading the view.
    }
    func createGradientLayer() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.locations = [0.0,0.5,1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        gradientLayer.colors = [#colorLiteral(red: 0.2876617405, green: 0.1378376123, blue: 0.6367876711, alpha: 1).cgColor ,#colorLiteral(red: 0.5843505705, green: 0.244217157, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.1984166595, green: 0.5985240222, blue: 0.7661567993, alpha: 1).cgColor]
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createGradientLayer()
    }
    func styledButtons() {
        reviseButton.layer.shadowColor = UIColor.black.cgColor
        reviseButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        reviseButton.layer.masksToBounds = false
        reviseButton.layer.shadowRadius = 1.0
        reviseButton.layer.shadowOpacity = 0.5
        reviseButton.layer.cornerRadius = reviseButton.frame.height / 2
        reviseButton.setTitle("Let's revise it!",for: .normal)
        reviseButton.titleLabel?.font=UIFont(name: "GillSans-SemiBold", size: 20)
        learnButton.layer.shadowColor = UIColor.black.cgColor
        learnButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        learnButton.layer.masksToBounds = false
        learnButton.layer.shadowRadius = 1.0
        learnButton.layer.shadowOpacity = 0.5
        learnButton.layer.cornerRadius = learnButton.frame.height / 2
        learnButton.setTitle("Learn new words!",for: .normal)
        learnButton.titleLabel?.font=UIFont(name: "GillSans-SemiBold", size: 20)
        learnButton.layer.shadowColor = UIColor.black.cgColor
        learnButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
        
        learnButton.addTarget(self, action: #selector(learnTapped), for: .touchUpInside)
        reviseButton.addTarget(self, action: #selector(reviseTapped), for: .touchUpInside)
    }
    @objc func learnTapped(){
        showDetail()
    }
    @objc func reviseTapped(){
        showQuiz()
    }
    func showDetail(){
        let storyboard=UIStoryboard.init(name: "Main", bundle: nil)
        let vc=storyboard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        let nc=UINavigationController.init(rootViewController: vc)
        present(nc, animated: true)
    }
    func showQuiz(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "QuizViewController") as! QuizViewController
        let nc = UINavigationController.init(rootViewController: vc)
        present(nc, animated: true)
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
