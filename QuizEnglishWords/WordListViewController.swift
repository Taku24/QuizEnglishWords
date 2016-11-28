//
//  WordList.swift
//  QuizEnglishWords
//
//  Created by mountain on 2016/11/07.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import UIKit

class WordListViewController: UIViewController {
    
    var array:[String] = ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"]
    
    let wordListView = UITableView()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        wordListView.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height)
        wordListView.delegate = self
        wordListView.dataSource = self
        self.view.addSubview(wordListView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

//MARK: UITableViewDelegate
extension WordListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//MARK: UITableViewDataSource
extension WordListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
}
