//
//  ResultViewController.swift
//  ZooGoApp
//
//  Created by 山﨑隼汰 on 2021/01/06.
//

import UIKit

class EastResultViewController: UIViewController,UIScrollViewDelegate{

    var passedAnimalName = [String]()
    
    var conditions = [(DataSet) -> Bool]()
   
    var resultList: [String] = []
  
    var dataset: [DataSet] = eastCuteData
    
    //スクリーンショット入れる入れ物
    var screenShotImage = UIImage()
    
    @IBOutlet weak var coverView: UIView!

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    // Totalのページ数
    var pageNum:Int!
     
    //スクリーンの幅
    let screenWidth = Int( UIScreen.main.bounds.size.width)
    //スクリーンの高さ
    let screenHeight = Int(UIScreen.main.bounds.size.height)
    
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.delegate = self
        
        //ページジングができるようになる
        scrollView.isPagingEnabled = true
    
        zooMatching(passedAnimalName: passedAnimalName)
        
        pageNum = resultList.count
        
        setupScrollImages()
        
        let imageTop:UIImage = UIImage(named:resultList[0])!
        
        for i in 0 ..< pageNum {
        // UIImageViewのインスタンス
        let image:UIImage = UIImage(named:resultList[i])!
        let imageView = UIImageView(image:image)
                    
            imageView.frame = CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            
            imageView.contentMode = .scaleAspectFit
                    
            imageView.tag = i + 1
                    
            // UIScrollViewのインスタンスに画像を貼付ける
            scrollView.addSubview(imageView)
                    
        }
        
        //ラベルの背景の角を丸くする
        titleLabel.layer.cornerRadius = 20.0
        titleLabel.clipsToBounds = true
        
        
        pageControl.numberOfPages = pageNum
        
        pageControl.currentPage = 0
        
        pageControl.isUserInteractionEnabled = false
        
        self.coverView.addSubview(pageControl)
        
        scrollView.addSubview(coverView)
        
    }
    
    func setupScrollImages(){

        //scrollViewのdelegateを自分に持ってくる
        scrollView.delegate = self
        
        //scrollViewの大きさを設定
        scrollView.frame = self.view.frame
        
        //スクロール稼働の領域を決める
        scrollView.contentSize = CGSize(width:screenWidth*pageNum, height:screenHeight-50)
        
        self.view.addSubview(scrollView)
    
       }

    @IBAction func dismissButton(_ sender: Any) {
   
       
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
        
    }
    
    @IBAction func share(_ sender: Any) {
  
    //スクリーンショットを撮る
    takeScreenShot()
          
    //スクリーンショットイメージをAny型にキャスト
    let items = [screenShotImage] as [Any]
            
    // アクティビティビューに乗っけて、シェアする
    let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
     present(activityVC, animated: true, completion: nil)
            
    }
    
    func zooMatching(passedAnimalName:[String] ) {
    
    //animalNameとpassedAnimalNameに含まれる要素を抽出
     
    for filterWord in passedAnimalName {

    conditions.append{$0.animalName.contains(filterWord)
        
        }
     }
    
     let filteredData = dataset.filter { element in conditions.reduce(false){$0 != $1(element)}
      
    }
        
    filteredData.forEach ({ element in
            
    resultList.append(element.parkName)
            
    })
    
    }

func scrollViewDidEndDecelerating (_ scrollView: UIScrollView) {
     
    if fmod(scrollView.contentOffset.x, scrollView.frame.maxX) == 0 {
    // ページの場所を切り替える.
    pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
        
            }
        }
    
  func takeScreenShot() {
 
    let width = CGFloat(UIScreen.main.bounds.size.width)
    let height = CGFloat(UIScreen.main.bounds.size.height/1.3)
    let size = CGSize(width: width, height: height)
    
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        //viewに書き出す
        self.view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        screenShotImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
    }

}
