

import UIKit

class SelectViewController: UIViewController {
    
    
    @IBOutlet weak var eastJapanButton: UIButton!
    
    @IBOutlet weak var westJapanButton: UIButton!
    
    @IBOutlet weak var coverView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ボタンの背景の角を丸くする
        self.eastJapanButton.layer.cornerRadius = 20.0
        self.westJapanButton.layer.cornerRadius = 20.0
        
    }
    
    @IBAction func dismissButton(_ sender: Any) {
   
    self.dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func eastScreenTransition(_ sender: Any) {
    
        performSegue(withIdentifier: "eastMatchingVC", sender: nil)
    
    }
    
    @IBAction func westScreenTransition(_ sender: Any) {
   
        performSegue(withIdentifier: "westMatchingVC", sender: nil)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if segue.identifier == "eastMatchingVC" {
        
            let eastmatchingVC = segue.destination as! MatchingViewController
        
            eastmatchingVC.animalImageSet = eastCuteData
            eastmatchingVC.passedtitleLabel = "1〜5枚のカードを選んでね"
            eastmatchingVC.swipeCount = 5
            
    
        } else if segue.identifier == "westMatchingVC" {
            
        let westmatchingVC = segue.destination as! MatchingViewController
            
            westmatchingVC.animalImageSet = westCuteData
            westmatchingVC.passedtitleLabel = "1〜5枚のカードを選んでね"
            westmatchingVC.swipeCount = 5
            
        }
    }
}
