//
//  WordList.swift
//  QuizEnglishWords
//
//  Created by mountain on 2016/11/07.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import UIKit
import SwiftyJSON

class WordListViewController: UIViewController {

    var englishWords = [Word]()
    
    let wordListView = UITableView()
    let loadJSON = LoadWordsFromJSON()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        wordListView.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height)
        wordListView.delegate = self
        wordListView.dataSource = self
        wordListView.register(UINib(nibName:"CustomCell",bundle:nil), forCellReuseIdentifier: "Cell")
        self.view.addSubview(wordListView)
        englishWords = loadJSON.loadAll()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
