//
//  CategoryViewController.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 4/13/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styledButtons()
        let closed=UIBarButtonItem.init(title: "Close", style: .done, target: self, action: #selector(closeTapped))
        navigationItem.rightBarButtonItem=closed
    }
    @objc func closeTapped(){
        dismiss(animated: true)
    }
    // MARK: -Gradient Background
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
    
    
    
    
    // MARK: -Style of Buttons
    func styledButtons() {
        easyButton.layer.shadowColor = UIColor.black.cgColor
        easyButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        easyButton.layer.masksToBounds = false
        easyButton.layer.shadowRadius = 1.0
        easyButton.layer.shadowOpacity = 0.5
        easyButton.layer.cornerRadius = easyButton.frame.height / 2
        easyButton.setTitle("Easy",for: .normal)
        easyButton.titleLabel?.font=UIFont(name: "GillSans-SemiBold", size: 40)
        mediumButton.layer.shadowColor = UIColor.black.cgColor
        mediumButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        mediumButton.layer.masksToBounds = false
        mediumButton.layer.shadowRadius = 1.0
        mediumButton.layer.shadowOpacity = 0.5
        mediumButton.layer.cornerRadius = mediumButton.frame.height / 2
        mediumButton.setTitle("Medium",for: .normal)
        mediumButton.titleLabel?.font=UIFont(name: "GillSans-SemiBold", size: 40)
        mediumButton.layer.shadowColor = UIColor.black.cgColor
        mediumButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        hardButton.layer.masksToBounds = false
        hardButton.layer.shadowRadius = 1.0
        hardButton.layer.shadowOpacity = 0.5
        hardButton.layer.cornerRadius = hardButton.frame.height / 2
        hardButton.setTitle("Hard",for: .normal)
        hardButton.titleLabel?.font=UIFont(name: "GillSans-SemiBold", size: 40)
        
        
        easyButton.addTarget(self, action: #selector(easyTapped), for: .touchUpInside)
        mediumButton.addTarget(self, action: #selector(mediumTapped), for: .touchUpInside)
        hardButton.addTarget(self, action: #selector(hardTapped), for: .touchUpInside)
        
    }
    @objc func easyTapped() {
        showDetail(.easy)
    }
    
    @objc func mediumTapped() {
        showDetail(.medium)
    }
    
    @objc func hardTapped() {
        showDetail(.hard)
    }
    
    func showDetail(_ level: WordLevel) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CaruselViewController") as! CaruselViewController
        vc.level=level
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
