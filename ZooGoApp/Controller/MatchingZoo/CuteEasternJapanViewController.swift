//
//  CuteViewController.swift
//  ZooGoApp
//
//  Created by 山﨑隼汰 on 2021/01/04.
//

import UIKit
import Koloda

class CuteEasternJapanController: UIViewController,KolodaViewDataSource,KolodaViewDelegate,UIGestureRecognizerDelegate {

    
    @IBOutlet weak var kolodaView: KolodaView!
    
    var imageNameArray = ["ホッキョクグマ","スナネコ", "レッサーパンダ","オウサマペンギン","ワオキツネザル","ベアードバク","シロサイ","アムールトラ","ゴリラ","カピバラ","タスマニアデビル","コアラ","エゾヒグマ","パンダ"]
    
    var likedArray = [String]()
    var nopedArray = [String]()
    
    
    @IBOutlet weak var overlayImageview: UIImageView!
    
    let overlayRightImageName = "likeJudgeImage"
    let overlayLeftImageName = "nopeJudgeImage"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
       
       self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal

    }
    
    //カード枚数設定
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
    
        return imageNameArray.count
    
    }
    
    //ドラッグのスピード
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        
        return .fast
    
    }

    //表示内容の設定
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        
        let imageView = UIImageView(frame: koloda.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageNameArray[index])
        koloda.addSubview(imageView)
        
        return imageView
        
    }
    
    //カードスワイプ終了
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
          
        
        print("Finish cards.")
        
        //シャッフル/拡張機能
        //imageNameArray = imageNameArray.shuffled()
        //リスタート
        //koloda.resetCurrentCardIndex()
  
   }
        
    //カードをタップした時に呼ばれる/拡張機能
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        //urlに飛べる
        //UIApplication.shared.openURL(URL(string: "")!)
    }
        
    //darag中に呼ばれる
    func koloda(_ koloda: KolodaView, shouldDragCardAt index: Int) -> Bool {
        print(index, "drag")
        
        overlayImageViewReset()
   
        return true
    }

    //dtagの方向など
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        print(index, direction)
   
        switch direction {
      
        case .left:
            overlayImageview.image = UIImage(named: overlayLeftImageName)
                    
            nopedArray.append(imageNameArray[index])
            
        
            return
       
        case.right:
            
            overlayImageview.image = UIImage(named: overlayRightImageName)

            likedArray.append((imageNameArray[index]as String?)!)
            
            print(likedArray)
                    
                    return
            
        default:
            
            overlayImageview.image = nil
            
        }
        
        overlayImageViewReset()
    
}
    

    func overlayImageViewReset(){
        
        overlayImageview.image = nil
        
        
    }
    
    
//    func byNavicationPush() {
//
//        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "navigationPushView") as!
//
//            nextVC.passedLikedArray = likedArray
//              self.navigationController?.pushViewController(nextVC, animated: true)
//        }
//
    
    
    @IBAction func likeButton(_ sender: Any) {
  
    
        kolodaView.swipe(.right)
    }
    
    
    
    @IBAction func nopeButton(_ sender: Any) {
   
        kolodaView.swipe(.left)
        
    }
    
    
    
    @IBAction func shuffleRestartButton(_ sender: Any) {
  
        kolodaView?.revertAction()
        
    }
    
    @IBAction func backButton(_ sender: Any) {
   
        self.dismiss(animated: true, completion: nil)


    
    }
    
    
    
    
}
