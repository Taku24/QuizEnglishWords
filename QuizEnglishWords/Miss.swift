//
//  Realm.swift
//  QuizEnglishWords
//
//  Created by TAKU on 2016/12/16.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import Foundation
import RealmSwift

class Miss: Object{
    
    static let realm = try! Realm()
    
    dynamic var id = 0
    dynamic var question: String!
    dynamic var answer: String!
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func create() -> Miss {
        let miss = Miss()
        miss.id = lastId()
        return miss
    }
    
    static func loadAll() -> [Miss] {
        let misses = realm.objects(Miss.self).sorted(byProperty: "id", ascending: false)
        var ret: [Miss] = []
        for miss in misses {
            ret.append(miss)
        }
        return ret
    }
    
    static func lastId() -> Int {
        if let miss = realm.objects(Miss.self).last {
            return miss.id + 1
        } else {
            return 1
        }
    }
    
    // addのみ
    func save() {
        try! Miss.realm.write {
            Miss.realm.add(self)
        }
    }
    
    func update(method: @escaping (() -> Void)) {
        try! Miss.realm.write {
            method()
        }
    }
    
    //削除メソッド
    func delete() {
        try! Miss.realm.write {
            Miss.realm.delete(self)
        }
    }

    
}
