//
//  QuestionViewController.swift
//  QuizEnglishWords
//
//  Created by mountain on 2016/12/12.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import UIKit
import FlatUIKit

class QuestionViewController: UIViewController{
    
    @IBOutlet weak var questionCountLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var selectView: UITableView!
    @IBOutlet weak var judgeLabel: UILabel!
    @IBOutlet weak var nextButton: FUIButton!
    
    var questionList = [Word]()
    var json = LoadWordsFromJSON()
    var isCorrect:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectView.delegate = self
        selectView.dataSource = self
        selectView.isScrollEnabled = false
        
        nextButton = CreateFlatButton.create(button: nextButton, mainColor: UIColor.peterRiver(), shadowColor: UIColor.belizeHole(), titleText: "次へ")
        nextButton.isHidden = true
        
        questionList = json.createQuestionList()
        createQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension QuestionViewController {
    
    fileprivate func createQuestion(){
        isCorrect = Int(arc4random() % 4)
        questionLabel.text = questionList[isCorrect].question
    }
    
}

