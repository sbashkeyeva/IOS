//
//  TeacherTableViewCell.swift
//  TableView
//
//  Created by Symbat Bashkeyeva on 3/3/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class TeacherTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    

    @IBOutlet weak var subjectLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setTeacher(_ teacher: Teacher){
        nameLabel.numberOfLines=0
        subjectLabel.numberOfLines=0
        nameLabel.text=teacher.name
        subjectLabel.text=teacher.subject
    }

}
