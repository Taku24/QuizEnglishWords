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
        
        testBtm = createButton(button: testBtm,mainColor: UIColor.amethyst(), shadowColor: UIColor.wisteria(), titleText:"テストを開始する")
        listBtm = createButton(button: listBtm,mainColor: UIColor.carrot(), shadowColor: UIColor.pumpkin(), titleText: "単語リスト")
        missListBtm = createButton(button: missListBtm,mainColor: UIColor.emerland(), shadowColor: UIColor.nephritis(), titleText: "間違えリスト")
        
        listBtm.addTarget(self, action: #selector(MainViewController.moveWordListView), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createButton(button: FUIButton ,mainColor: UIColor,shadowColor: UIColor, titleText:String) -> FUIButton{
        button.buttonColor = mainColor
        button.shadowColor = shadowColor
        button.shadowHeight = 3.0
        button.cornerRadius = 6.0
        button.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(20))
        button.setTitle(titleText, for: UIControlState.normal)
        button.setTitleColor(UIColor.clouds(), for: UIControlState.normal)
        button.setTitleColor(UIColor.clouds(), for: UIControlState.highlighted)
        return button
    }

    func moveWordListView(){
        let listVC = WordList()
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
}

