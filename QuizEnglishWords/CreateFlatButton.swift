//
//  CreateButton.swift
//  QuizEnglishWords
//
//  Created by TAKU on 2016/11/20.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import Foundation
import FlatUIKit

class CreateFlatButton {
    
    static func create(button: FUIButton ,mainColor: UIColor,shadowColor: UIColor, titleText:String) -> FUIButton{
        button.buttonColor = mainColor
        button.shadowColor = shadowColor
        button.shadowHeight = 3.0
        button.cornerRadius = 6.0
        button.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(20))
        button.setTitle(titleText, for: UIControlState.normal)
        button.setTitleColor(UIColor.clouds(), for: UIControlState.normal)
        button.setTitleColor(UIColor.clouds(), for: UIControlState.highlighted)
        return button
    }
    
}
