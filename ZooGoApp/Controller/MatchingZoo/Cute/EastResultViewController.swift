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
    
    let zooNameA = UILabel()
    
    let zooNameB = UILabel()
    
    let zooNameC = UILabel()
    
    let zooNameD = UILabel()
    
    let zooNameE = UILabel()
    
    //スクリーンショット入れる入れ物
    var screenShotImage = UIImage()
    
    
    @IBOutlet weak var coverView: UIView!
    

    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    let img:[String] = ["パンダ","スナネコ","ゴリラ"]
    
    // Totalのページ数
    var pageNum:Int!
     
    //スクリーンの幅
    let screenWidth = Int( UIScreen.main.bounds.size.width)
    //スクリーンの高さ
    let screenHeight = Int(UIScreen.main.bounds.size.height)
    
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ページジングができるようになる
        scrollView.isPagingEnabled = true
        
        setupScrollImages()
        
        let imageTop:UIImage = UIImage(named:img[0])!
        pageNum = img.count
        
        for i in 0 ..< pageNum {
        // UIImageViewのインスタンス
        let image:UIImage = UIImage(named:img[i])!
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
        
        coverView.frame = CGRect(x: 0, y: 0, width: screenWidth*pageNum, height: screenHeight)
        coverView.backgroundColor = .clear
        scrollView.addSubview(coverView)
   
        
        
    }
    
    func setupScrollImages(){
           
       
        //scrollViewのdelegateを自分に持ってくる
        scrollView.delegate = self
        
        //scrollViewの大きさを設定
        scrollView.frame = self.view.frame
        
        //スクロール稼働の領域を決める
        scrollView.contentSize = CGSize(width:screenWidth*3, height:screenHeight-50)
        
        self.view.addSubview(scrollView)
        
           
       }
   

    
    @IBAction func dismissButton(_ sender: Any) {
   
       
    self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
        
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
