//
//  QuestionViewController + Delegate.swift
//  QuizEnglishWords
//
//  Created by TAKU on 2016/12/15.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import UIKit

extension QuestionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(isCorrect == indexPath.row){
            judgeLabel.text = "正解"
        }
        else {
            judgeLabel.text = "不正解"
            failedCount += 1
        }
        tableView.allowsSelection = false
        nextButton.isHidden = false
    }
    
}
