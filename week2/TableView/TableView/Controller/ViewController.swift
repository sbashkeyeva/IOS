//
//  ViewController.swift
//  TableView
//
//  Created by Symbat Bashkeyeva on 3/3/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

var teachers=TeacherGenerator.getTeacher()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teachers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherTableViewCell", for: indexPath) as! TeacherTableViewCell
        let teacher=teachers[indexPath.row]
        cell.setTeacher(teacher)
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 150
    }
    
 @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

