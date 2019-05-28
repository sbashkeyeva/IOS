//
//  FinalViewController.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 5/28/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    var score:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text="Your final score is: \(score)"
        let closeButton = UIBarButtonItem.init(title: "Close", style: .done, target: self, action: #selector(closeTapped))
        navigationItem.rightBarButtonItem = closeButton
        // Do any additional setup after loading the view.
    }
    @objc func closeTapped(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ChoiceViewController")
        self.present(controller, animated: true, completion: nil)
        
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
