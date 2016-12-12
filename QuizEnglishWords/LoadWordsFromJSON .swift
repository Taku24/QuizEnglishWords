//
//  LoadWordFromJSON .swift
//  QuizEnglishWords
//
//  Created by mountain on 2016/12/12.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import SwiftyJSON

class LoadWordsFromJSON {
    
    static func loadAll() -> [Word]{
        var words = [Word]()
        let path :String = Bundle.main.path(forResource: "EnglishWordsLsit",ofType:"json")!
        let fileHandle : FileHandle = FileHandle(forReadingAtPath: path)!
        let data : NSData = fileHandle.readDataToEndOfFile() as NSData
        let json = JSON(data:data as Data)
        let wordsData = json["list"]
        for i in 0..<json["list"].count{
            let word = Word(question: wordsData[i]["question"].stringValue, answer: wordsData[i]["answer"].stringValue);
            words.append(word)
        }
        
        return words
    }

}
