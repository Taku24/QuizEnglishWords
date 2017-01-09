//
//  WordListViewController + Delegate.swift
//  QuizEnglishWords
//
//  Created by TAKU on 2016/12/16.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import UIKit

//MARK: UITableViewDelegate
extension MissListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert:UIAlertController = UIAlertController(title: wronghWords[indexPath.row].question, message:wronghWords[indexPath.row].answer, preferredStyle: .alert)
        let okAction :UIAlertAction = UIAlertAction(title:Construct.ok, style: .default, handler:{
            (action:UIAlertAction!) -> Void in
            
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
