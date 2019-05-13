//
//  QuizViewController.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 5/13/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController,CaruselDelegate {
    @IBOutlet weak var initWordLabel: UILabel!
    func didSendWord(card: Card) {
        initWordLabel.text=card.initialWord
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let controller=storyboard?.instantiateViewController(withIdentifier: "CaruselViewController") as! CaruselViewController
        controller.delegate=self
        print(controller.cards.count)
        // Do any additional setup after loading the view.
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
