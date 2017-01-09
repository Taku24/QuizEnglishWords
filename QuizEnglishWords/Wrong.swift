//
//  Realm.swift
//  QuizEnglishWords
//
//  Created by TAKU on 2016/12/16.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import Foundation
import RealmSwift

class Wrong: Object{
    
    static let realm = try! Realm()
    
    dynamic var id = 0
    dynamic var question: String!
    dynamic var answer: String!
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func create() -> Wrong {
        let wrong = Wrong()
        wrong.id = lastId()
        return wrong
    }
    
    static func loadAll() -> [Wrong] {
        let wrongs = realm.objects(Wrong.self).sorted(byProperty: "id", ascending: false)
        var ret: [Wrong] = []
        for wrong in wrongs {
            ret.append(wrong)
        }
        return ret
    }
    
    static func lastId() -> Int {
        if let wrong = realm.objects(Wrong.self).last {
            return wrong.id + 1
        } else {
            return 1
        }
    }
    
    // addのみ
    func save() {
        try! Wrong.realm.write {
            Wrong.realm.add(self)
        }
    }
    
    func update(method: @escaping (() -> Void)) {
        try! Wrong.realm.write {
            method()
        }
    }
    
    //削除メソッド
    func delete() {
        try! Wrong.realm.write {
            Wrong.realm.delete(self)
        }
    }

    
}
