//
//  ProfileViewController.swift
//  TableView
//
//  Created by Symbat Bashkeyeva on 3/3/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var manager=Manager()
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var enrollButton: UIButton!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func buttonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "profile", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showTeacher()
        // Do any additional setup after loading the view.
    }
    func showTeacher(){
        let teacher=manager.getCurrentTeacher()
        nameLabel.text=teacher.name
        image.image=UIImage(named: teacher.image)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as! ViewController
        
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
