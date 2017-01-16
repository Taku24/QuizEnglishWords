//
//  WordList.swift
//  QuizEnglishWords
//
//  Created by mountain on 2016/11/07.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import UIKit
import SwiftyJSON

class MissListViewController: UIViewController {
    
    var wronghWords = [Word]()
    
    let missListView = UITableView()
    let loadJSON = LoadWordsFromJSON()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        missListView.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height)
        missListView.delegate = self
        missListView.dataSource = self
        missListView.register(UINib(nibName:"CustomCell",bundle:nil), forCellReuseIdentifier: "Cell")
        self.view.addSubview(missListView)
        wronghWords = loadJSON.loadAll()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
