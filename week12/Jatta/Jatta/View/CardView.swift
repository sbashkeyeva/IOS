//
//  CardView.swift
//  Jatta
//
//  Created by Symbat Bashkeyeva on 4/16/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {

    @IBInspectable var cornerRadius:CGFloat=2
    @IBInspectable var shadowOffSetWidth:CGFloat=0
    @IBInspectable var shadowOffSetHeight:CGFloat=5
    @IBInspectable var shadowColor:UIColor=UIColor.black
    @IBInspectable var shadowOpacity:CGFloat=0.5
    override func layoutSubviews() {
        layer.cornerRadius=cornerRadius
        layer.shadowColor=shadowColor.cgColor
        layer.shadowOffset=CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        let shadowPath=UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath=shadowPath.cgPath
        layer.shadowOpacity=Float(shadowOpacity)
    }

}
