//
//  ViewController.swift
//  QuizEnglishWords
//
//  Created by TAKU on 2016/10/24.
//  Copyright © 2016年 Kandai. All rights reserved.
//

import UIKit
import FlatUIKit

class MainViewController: UIViewController {

    @IBOutlet weak var testBtm: FUIButton!
    @IBOutlet weak var listBtm: FUIButton!
    @IBOutlet weak var missListBtm: FUIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "単語帳"
        setUpButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

//MARK: PrivateMethod
extension MainViewController {
    
    func setUpButton(){
        testBtm = CreateFlatButton.create(button: testBtm,mainColor: UIColor.amethyst(), shadowColor: UIColor.wisteria(), titleText:"テストを開始する")
        listBtm = CreateFlatButton.create(button: listBtm,mainColor: UIColor.carrot(), shadowColor: UIColor.pumpkin(), titleText: "単語リスト")
        missListBtm = CreateFlatButton.create(button: missListBtm,mainColor: UIColor.emerland(), shadowColor: UIColor.nephritis(), titleText: "間違えリスト")
        
        listBtm.addTarget(self, action: #selector(MainViewController.moveWordListView), for: .touchUpInside)
    }
    
    //push
    func moveWordListView(){
        let listVC = WordListViewController()
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
}

