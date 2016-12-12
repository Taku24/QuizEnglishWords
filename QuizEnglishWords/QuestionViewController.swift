//
//  QuestionViewController.swift
//  QuizEnglishWords
//
//  Created by mountain on 2016/12/12.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController{
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var selectView: UITableView!
    
    var list: [String] = ["Apple", "Banana", "Orange", "Peach"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        selectView.delegate = self
        selectView.dataSource = self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension QuestionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension QuestionViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }

}
