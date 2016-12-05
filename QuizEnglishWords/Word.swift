//
//  Word.swift
//  QuizEnglishWords
//
//  Created by TAKU on 2016/11/20.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import Foundation

class Word {
    
    var question: String!
    
    var answer: String!
    
    var isCorrect: Bool!
    
    var checkImage: String!
    
    init(question: String, answer: String){
        self.question = question
        self.answer = answer
    }
    
}
