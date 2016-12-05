//
//  CustomCell.swift
//  QuizEnglishWords
//
//  Created by mountain on 2016/12/05.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var wordtitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
