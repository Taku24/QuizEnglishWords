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
        self.navigationItem.title = Construct.navigationTitle
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
        testBtm = CreateFlatButton.create(button: testBtm,mainColor: UIColor.amethyst(), shadowColor: UIColor.wisteria(), titleText:Construct.testTitle)
        listBtm = CreateFlatButton.create(button: listBtm,mainColor: UIColor.carrot(), shadowColor: UIColor.pumpkin(), titleText: Construct.wordListTitle)
        missListBtm = CreateFlatButton.create(button: missListBtm,mainColor: UIColor.emerland(), shadowColor: UIColor.nephritis(), titleText: Construct.wrongListTitle)
        
        listBtm.addTarget(self, action: #selector(MainViewController.moveWordListView), for: .touchUpInside)
    }
    
    //push
    func moveWordListView(){
        let listVC = WordListViewController()
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
}

