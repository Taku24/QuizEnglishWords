//
//  WordListViewController + Delegate.swift
//  QuizEnglishWords
//
//  Created by TAKU on 2016/12/16.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import UIKit

//MARK: UITableViewDelegate
extension WordListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
