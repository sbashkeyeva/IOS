//
//  ContactTableViewCell.swift
//  GetContact
//
//  Created by Symbat Bashkeyeva on 3/5/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setContact(_ contact: Contact){
        nameLabel.text=contact.firstname
        phoneLabel.text=contact.phone
        switch contact.tagColor {
        case .blue:
            backgroundColor=UIColor.blue
        case .green:
            backgroundColor=UIColor.green
        case .orange:
            backgroundColor=UIColor.orange
        case .red:
            backgroundColor=UIColor.red
        case .yellow:
            backgroundColor=UIColor.yellow
        }
    }

}
