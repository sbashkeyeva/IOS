//
//  TagCollectionViewCell.swift
//  GetContact
//
//  Created by Symbat Bashkeyeva on 3/6/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagButton: UIButton!
//    var arr = Contact.TagColor.AllCases()
    var arr = Contact.TagColor.allValues
    var color:UIColor=UIColor.green
 
    func setTag(_ index: Int){
           print(arr)
        print(index)
        switch index {
        case 0:
            tagButton.backgroundColor=UIColor.red
            color=UIColor.red
        case 1:
            tagButton.backgroundColor=UIColor.blue
            color=UIColor.blue
        case 2:
            tagButton.backgroundColor=UIColor.yellow
            color=UIColor.yellow
        case 3:
            tagButton.backgroundColor=UIColor.green
            color=UIColor.green
        case 4:
            tagButton.backgroundColor=UIColor.orange
            color=UIColor.orange
        default:
            print("hello")
        }
//        if arr.count==index{
//            tagButton.backgroundColor=color
//        }
       // tagButton.backgroundColor=arr[index]
        
    }
    
}
