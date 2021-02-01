

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    var soundFile = SoundFile()
    
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
    
    @IBAction func feedingScreenTransition(_ sender: Any) {
   
        soundFile.playSound(fileName: "決定音声", extensionName: "mp3")
        performSegue(withIdentifier: "feedingMatchingVC", sender: nil)
    
    
    }
    
    @IBAction func eventScreenTransition(_ sender: Any) {
    
        soundFile.playSound(fileName: "決定音声", extensionName: "mp3")
        performSegue(withIdentifier: "eventMatchingVC", sender: nil)
    
  
    }
    
    @IBAction func endangeredSpeciesScreenTransition(_ sender: Any) {
        
        soundFile.playSound(fileName: "決定音声", extensionName: "mp3")
        performSegue(withIdentifier: "endangeredSpeciesMatchingVC", sender: nil)
    
    }
    
    @IBAction func cuteTransition(_ sender: Any) {
   
        soundFile.playSound(fileName: "決定音声", extensionName: "mp3")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if segue.identifier == "feedingMatchingVC" {
        
            let feedingMatchingVC = segue.destination as! MatchingViewController
        
            feedingMatchingVC.animalImageSet = feedingData
            feedingMatchingVC.passedtitleLabel = "1〜3枚のカードを選んでね"
            feedingMatchingVC.swipeCount = 3
            
        }else if segue.identifier == "eventMatchingVC" {
            
            let eventMatchingVC = segue.destination as! MatchingViewController
        
            eventMatchingVC.animalImageSet = eventData
            eventMatchingVC.passedtitleLabel = "1〜3枚のカードを選んでね"
            eventMatchingVC.setLabel = "選択したイベント一覧"
            eventMatchingVC.swipeCount = 3
        
    }else if segue.identifier == "endangeredSpeciesMatchingVC" {
        
        let endangeredSpeciesMatchingVC = segue.destination as! MatchingViewController
    
        endangeredSpeciesMatchingVC.animalImageSet = endangeredSpeciesData
        endangeredSpeciesMatchingVC.passedtitleLabel = "1〜5枚のカードを選んでね"
        endangeredSpeciesMatchingVC.swipeCount = 5
        
    }
}
    
}
