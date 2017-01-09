//
//  LoadWordFromJSON.swift
//  QuizEnglishWords
//
//  Created by mountain on 2016/12/12.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import SwiftyJSON

class LoadWordsFromJSON {
    
    private func createJSON() -> JSON {
        let path :String = Bundle.main.path(forResource: "EnglishWordsLsit",ofType:"json")!
        let fileHandle : FileHandle = FileHandle(forReadingAtPath: path)!
        let data : NSData = fileHandle.readDataToEndOfFile() as NSData
        let json = JSON(data:data as Data)
        return json
    }
    
    public func loadAll() -> [Word]{
        var words = [Word]()
        let json = createJSON()
        let wordsData = json["list"]
        for i in 0..<json["list"].count{
            let word = Word(question: wordsData[i]["question"].stringValue, answer: wordsData[i]["answer"].stringValue);
            words.append(word)
        }
        
        return words
    }
    
    public func createQuestionList() -> [Word]{
        var questions = [Word]()
        var questionsData = loadAll()
        var number = createRandom()
        
        for j in 0..<4 {
            questions.append(questionsData[number[j]])
        }
        
        return questions
    }
    
    private func createRandom() -> [Int]{
        var cnt = 0
        var randNumbers = [Int]()
        while(true){
            for _ in 0..<4 {
                let random = Int(arc4random() % 20)
                randNumbers.append(random)
            }
            
            for x in 0..<3 {
                for y in x+1..<4 {
                    if(randNumbers[x] == randNumbers[y]){
                        cnt += 1
                    }
                }
            }
            
            if(cnt == 0){
                break
            }
            else {
                cnt = 0
                randNumbers.removeAll()
            }
        }
        return randNumbers
    }

}
