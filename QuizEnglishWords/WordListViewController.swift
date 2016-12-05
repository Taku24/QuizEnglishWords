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
    
    override func viewDidLoad(){
        super.viewDidLoad()
        wordListView.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height)
        wordListView.delegate = self
        wordListView.dataSource = self
        wordListView.register(UINib(nibName:"CustomCell",bundle:nil), forCellReuseIdentifier: "Cell")
        self.view.addSubview(wordListView)
        createListData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

//MARK: AddMyMythod
extension WordListViewController {
    
    func createListData(){
        let path :String = Bundle.main.path(forResource: "EnglishWordsLsit",ofType:"json")!
        let fileHandle : FileHandle = FileHandle(forReadingAtPath: path)!
        let data : NSData = fileHandle.readDataToEndOfFile() as NSData
        let json = JSON(data:data as Data)
        let wordsData = json["list"]
        for i in 0..<json["list"].count{
            let word = Word(question: wordsData[i]["question"].stringValue, answer: wordsData[i]["answer"].stringValue);
            englishWords.append(word)
        }
    }
}

//MARK: UITableViewDelegate
extension WordListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Answer:\(englishWords[indexPath.row].answer)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//MARK: UITableViewDataSource
extension WordListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return englishWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCell
        cell.wordtitle.text = englishWords[indexPath.row].question
        if(indexPath.row % 2 == 0){
            cell.imageview.image = UIImage(named:"1.png")
        }
        else {
            cell.imageview.image = UIImage(named:"2.png")
        }
        return cell
    }
    
}
