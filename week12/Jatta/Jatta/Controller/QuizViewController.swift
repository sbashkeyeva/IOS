//
//  QuizViewController.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 5/13/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController{
    
    @IBOutlet weak var initWordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let closeButton = UIBarButtonItem.init(title: "Close", style: .done, target: self, action: #selector(closeTapped))
        navigationItem.rightBarButtonItem = closeButton
    }
    @objc func closeTapped(){
        dismiss(animated: true)
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
