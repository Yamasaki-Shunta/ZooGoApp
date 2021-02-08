//
//  IntroViewController.swift
//  NewsTest
//
//  Created by 山﨑隼汰 on 2020/11/24.
//

import UIKit
import Lottie

class IntroViewController: UIViewController,UIScrollViewDelegate{

    //jsonを入れる箱と表示させる
    var onboardArray = ["1","2","3","4"]
    
    //テキストを用意する
    var onboardStringArray = ["休止している場合がございます","お気に入りの動物をスワイプしよう！","動画と音楽を合成しよう","動物の最新情報を見よう！"]
    
    //スクリーンの幅
    let screenWidth = Int( UIScreen.main.bounds.size.width)
    //スクリーンの高さ
    let screenHeight = Int(UIScreen.main.bounds.size.height)
    
    let scrollView = UIScrollView()
    
    @IBOutlet weak var coverView: UIView!
    
    @IBOutlet weak var pageContol: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ページジングができるようになる
        scrollView.isPagingEnabled = true
        
        self.scrollView.delegate = self
        
        setUpScroll()
            
        //lottieAnimationを使用できるようにする
        for i in 0...3{
            
            let animationView = AnimationView()
            let animation = Animation.named(onboardArray[i])
           
            animationView.frame = CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            animationView.animation = animation
            //lottieの画面サイズを決める(変更可能)
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            scrollView.addSubview(animationView)
            
        }
        
        coverView.frame = CGRect(x: 0, y: 0, width: screenWidth*3, height: screenHeight)
        coverView.backgroundColor = .clear
        scrollView.addSubview(coverView)

    }
    //ナビゲーションバーを消す
        override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }

    func setUpScroll(){
        
        //scrollViewのdelegateを自分に持ってくる
        scrollView.delegate = self

        //scrollViewの大きさを設定
        scrollView.frame = self.view.frame
        
        //スクロール稼働の領域を決める
        scrollView.contentSize = CGSize(width:screenWidth*4, height:screenHeight-50)
        
        self.view.addSubview(scrollView)
        
        //テキスト反映
        for i in 0...3{
            
            let onboardLabelA = UILabel(frame: CGRect(x:CGFloat(i)*view.frame.size.width, y: -225, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            onboardLabelA.font = UIFont.boldSystemFont(ofSize: 20)
            
            let onboardLabelB = UILabel(frame: CGRect(x:CGFloat(i)*view.frame.size.width, y: -250, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            onboardLabelB.text = "COVID‑19の影響で動物の展示やイベントが"
            onboardLabelB.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboardLabelB.textAlignment =  .center
           
            
            let onboardLabelC = UILabel(frame: CGRect(x:CGFloat(i)*view.frame.size.width, y: -200, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            onboardLabelC.text = "予めご了承下さい"
            onboardLabelC.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboardLabelC.textAlignment =  .center
            
            onboardLabelA.text = onboardStringArray[i]
     
            onboardLabelA.textAlignment =  .center
            
        if i == 0 {
            
            onboardLabelA.textColor = .red
            onboardLabelA.font = UIFont.boldSystemFont(ofSize: 15.0)
            
            scrollView.addSubview(onboardLabelB)
            scrollView.addSubview(onboardLabelC)
                
        }else if i == 2 {
            
            onboardLabelC.text = "縦向きで撮影してね！"
            onboardLabelC.textColor = .red
            onboardLabelC.font = UIFont.boldSystemFont(ofSize: 20)
            scrollView.addSubview(onboardLabelC)
    
        }
            
            scrollView.addSubview(onboardLabelA)
            
    }
    
    }
    
    @IBAction func tapPageControl(_ sender:UIPageControl) {
   
        scrollView.contentOffset.x = scrollView.frame.maxX * CGFloat(sender.currentPage)
    
    }
    
    func scrollViewDidEndDecelerating (_ scrollView: UIScrollView) {
     
            //ページコントロールに現在のページ番号を設定する。
        pageContol.currentPage = Int (scrollView.contentOffset.x / scrollView.frame.maxX)
        
        }
    
    @IBAction func skipButton(_ sender: Any) {
 
        self.dismiss(animated: true, completion: nil)
    
    }

}
