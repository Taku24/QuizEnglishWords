//
//  QuestionViewController + DataSource.swift
//  QuizEnglishWords
//
//  Created by TAKU on 2016/12/15.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import UIKit

extension QuestionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = questionList[indexPath.row].answer
        return cell
    }
    
}
