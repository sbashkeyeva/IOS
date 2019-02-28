//
//  FinalViewController.swift
//  QuizApp
//
//  Created by Symbat Bashkeyeva on 2/28/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController  {

    @IBOutlet weak var scoreLabel: UILabel!
    var finalScore=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showResult()
        // Do any additional setup after loading the view.
    }
    func showResult(){
        scoreLabel.text="Your final score is: "+finalScore
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
