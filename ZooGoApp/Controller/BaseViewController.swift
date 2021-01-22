//
//  BaseViewController.swift
//  NewsTest
//
//  Created by 山﨑隼汰 on 2020/11/29.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //ラベルの背景の角を丸くする
        self.questionLabel.layer.cornerRadius = 20.0
        
        self.questionLabel.clipsToBounds = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
    
        let ud = UserDefaults.standard
        let firstLunchKey = "firstLunch"
        if ud.bool(forKey: firstLunchKey) {
        ud.set(false, forKey: firstLunchKey)
        ud.synchronize()
     
        performSegue(withIdentifier: "introVC", sender: nil)
  
        }

    }
    
    //ナビゲーションバーを消す
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }

}
