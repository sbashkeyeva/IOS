//
//  TagCollectionViewCell.swift
//  GetContact
//
//  Created by Symbat Bashkeyeva on 3/6/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var checkImage: UIImageView!
    
    //    @IBOutlet weak var tagButton: UIButton!
//    var arr = Contact.TagColor.AllCases()
//    var arr = Contact.TagColor.allValues
//    var color:UIColor=UIColor.green
    func setTagColor(_ tagColor: TagColor){
        switch tagColor {
        case .red:
            backgroundColor=UIColor.red
        case .blue:
            backgroundColor=UIColor.blue
        case .yellow:
            backgroundColor=UIColor.yellow
        case .green:
            backgroundColor=UIColor.green
        case .orange:
            backgroundColor=UIColor.orange
            
            
        }
        
//        if arr.count==index{
//            tagButton.backgroundColor=color
//        }
       // tagButton.backgroundColor=arr[index]
        
    }
    
}
