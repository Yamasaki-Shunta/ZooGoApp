

import UIKit
import Koloda

class MatchingViewController: UIViewController,KolodaViewDataSource,KolodaViewDelegate,UIGestureRecognizerDelegate {

    
    var animalImageSet:[DataSet] = []
    
    var animalImage:[String] = []
    
    var likedArray = [String]()
    
    var nopedArray = [String]()
    
    var passedtitleLabel = String()
    
    var swipeCount = Int()
    
    var setLabel = String()
    
    let overlayRightImageName = "likeJudgedImage"
    
    let overlayLeftImageName = "nopeJudgedImage"
    
    @IBOutlet weak var overlayImageview: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var kolodaView: KolodaView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = passedtitleLabel
        
        dataSet()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
       
       self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal

    }
    
    func dataSet() {
        
        animalImageSet.forEach { element in
            
            animalImage.append(element.animalName)
            
        }
        
        animalImage = animalImage.shuffled()
        
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
        
        DidSwipeCardsScreenTransition(koloda)
  
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
           
            nopedArray.append((animalImage[index]as String?)!)
            
            print(nopedArray)
       
     
        case.right:
            
            overlayImageview.image = UIImage(named: overlayRightImageName)

            likedArray.append((animalImage[index]as String?)!)
           
            //重複している要素の削除
            
            let orderedSet: NSOrderedSet = NSOrderedSet(array: likedArray)
            
            likedArray =  orderedSet.array as! [String]
            
            nopedArray.removeAll()
    
            print(likedArray)
            
            screenTransition()
                    
            return
            
        default:
            
            return
            
        }
        
        }
    
    func screenTransition() {
    
        if likedArray.count == swipeCount {
            
            performSegue(withIdentifier: "swipeAnimalVC", sender: nil)

        }
    }
    
    func DidSwipeCardsScreenTransition(_ koloda: KolodaView) {
    
        if likedArray.count > 0 {
        
        performSegue(withIdentifier: "swipeAnimalVC", sender: nil)
            
        }else{
        
        koloda.resetCurrentCardIndex()
        
            
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if segue.identifier == "swipeAnimalVC" {
        
        let swipeAnimalVC = segue.destination as! SwipeAnimalViewController
       
            swipeAnimalVC.swipedAnimalName = likedArray
            swipeAnimalVC.selectData = animalImageSet
            
            if setLabel != ""{
                
                swipeAnimalVC.passedSetLabel = setLabel
           
            }else{
            
                return
                
            }
      }
        
    }
    
    @IBAction func likeButton(_ sender: Any) {
  
        kolodaView.swipe(.right)
        
    }
    
    @IBAction func nopeButton(_ sender: Any) {
   
        kolodaView.swipe(.left)
        
    }
    
    //カードを一つ戻す
    @IBAction func revertButton(_ sender: Any) {

        if  nopedArray == [] {
            
            likedArray.removeLast()
            
        }
        
        kolodaView?.revertAction()
        
    }
    
    @IBAction func dismissButton(_ sender: Any) {
   
        self.dismiss(animated: true, completion: nil)
        
    }
}
