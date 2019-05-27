//
//  CardTableViewCell.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 5/15/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var initWordLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setWord(card:Card){
        initWordLabel.text = card.initialWord
    }

}
