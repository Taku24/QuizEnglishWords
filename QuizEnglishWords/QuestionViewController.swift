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
    var questionCount = 0
    var failedCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectView.delegate = self
        selectView.dataSource = self
        selectView.isScrollEnabled = false
        
        nextButton = CreateFlatButton.create(button: nextButton, mainColor: UIColor.peterRiver(), shadowColor: UIColor.belizeHole(), titleText: Construct.next)
        
        createQuestion()
        
        nextButton.addTarget(self, action: #selector(QuestionViewController.nextQuestion), for: .touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension QuestionViewController {
    
    fileprivate func createQuestion(){
        questionCount += 1
        isCorrect = Int(arc4random() % 4)
        changeTextLabel(questionCount: questionCount)
        nextButton.isHidden = true
        selectView.allowsSelection = true
        selectView.reloadData()
    }
    
    private func changeTextLabel(questionCount: Int){
        questionList = json.createQuestionList()
        questionCountLabel.text = String(questionCount) + "問目"
        questionLabel.text = questionList[isCorrect].question
        judgeLabel.text = ""
    }
    
    func nextQuestion(){
        if(questionCount == 10){
            let alert:UIAlertController = UIAlertController(title: Construct.finish, message:String(failedCount) + "問ミス", preferredStyle: .alert)
            let okAction :UIAlertAction = UIAlertAction(title:Construct.ok, style: .default, handler:{
                (action:UIAlertAction!) -> Void in
                self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            createQuestion()
        }
    }
    
}

