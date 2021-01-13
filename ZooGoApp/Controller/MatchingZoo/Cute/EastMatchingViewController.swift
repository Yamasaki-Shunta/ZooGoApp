//
//  CuteViewController.swift
//  ZooGoApp
//
//  Created by 山﨑隼汰 on 2021/01/04.
//

import UIKit
import Koloda

class EastMatchingViewController: UIViewController,KolodaViewDataSource,KolodaViewDelegate,UIGestureRecognizerDelegate {

    
    @IBOutlet weak var kolodaView: KolodaView!
    
    var animalImageSet:[DataSet] = eastCuteData
    
    var animalImage:[String] = []
    
    var likedArray = [String]()
    
    @IBOutlet weak var overlayImageview: UIImageView!
    
    let overlayRightImageName = "likeJudgedImage"
    let overlayLeftImageName = "nopeJudgedImage"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSet()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
       
       self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal

    }
    
    
    func dataSet() {
        
        animalImageSet.forEach { element in
            
            animalImage.append(element.animalName)
            
        }
        
        
    }
    
    
    
    //カード枚数設定
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
    
        return animalImage.count
    
    }
    
    //ドラッグのスピード
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        
        return .fast
    
    }

    //表示内容の設定
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        
        let imageView = UIImageView(frame: koloda.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: animalImage[index])
        koloda.addSubview(imageView)
        
        return imageView
        
    }
    
    //カードスワイプ終了
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
          
        
        print("Finish cards.")
        screenTransition()
       
        //シャッフル/拡張機能
        //imageNameArray = imageNameArray.shuffled()
        //リスタート/拡張機能
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
        
        overlayImageview.image = nil
   
        return true
    }

    //dtagの方向など
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        print(index, direction)
   
        switch direction {
      
        case .left:
            overlayImageview.image = UIImage(named: overlayLeftImageName)
       
        case.right:
            
            overlayImageview.image = UIImage(named: overlayRightImageName)

            likedArray.append((animalImage[index]as String?)!)
           
            let orderedSet: NSOrderedSet = NSOrderedSet(array: likedArray)
            
            likedArray =  orderedSet.array as! [String]
    
            screenTransition()
            
            print(likedArray)
                    
                    return
            
        default:
            
            return
            
        }
        
    
}
    
    
    func screenTransition() {
    
        if likedArray.count == 5 {
            
            performSegue(withIdentifier: "resultVC", sender: nil)

            
        }

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if segue.identifier == "resultVC" {
        
        let ResultVC = segue.destination as! EastResultViewController

       
        ResultVC.passedAnimalName = likedArray
        
      }
        
    }
    
    
    @IBAction func likeButton(_ sender: Any) {
  
    
        kolodaView.swipe(.right)
    }
    
    
    
    @IBAction func nopeButton(_ sender: Any) {
   
        kolodaView.swipe(.left)
        
    }
    
    
    
    @IBAction func revertButton(_ sender: Any) {

            kolodaView?.revertAction()
        
    }
    
    @IBAction func dismissButton(_ sender: Any) {
   
        self.dismiss(animated: true, completion: nil)


    
    }
    
    
    
    
    
}
