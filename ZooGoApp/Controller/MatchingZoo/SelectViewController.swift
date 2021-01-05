//
//  SelectViewController.swift
//  ZooGoApp
//
//  Created by 山﨑隼汰 on 2021/01/04.
//

import UIKit

class SelectViewController: UIViewController {

  
    @IBOutlet weak var eastJapanButton: UIButton!
    
    
    @IBOutlet weak var westJapanButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ボタンの背景の角を丸くする
        self.eastJapanButton.layer.cornerRadius = 20.0
        self.westJapanButton.layer.cornerRadius = 20.0
        
        // Do any additional setup after loading the view.
    }
    
 
    
    @IBAction func dismissButton(_ sender: Any) {
   
        self.dismiss(animated: true, completion: nil)
    
    
    }
    
    
   

}
