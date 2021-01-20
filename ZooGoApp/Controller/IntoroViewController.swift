//
//  IntoroViewController.swift
//  NewsTest
//
//  Created by 山﨑隼汰 on 2020/11/24.
//

import UIKit
import Lottie

class IntoroViewController: UIViewController,UIScrollViewDelegate{

    //jsonを入れる箱と表示させる
    var onboardArray = ["1","2","3"]
    
    //テキストを用意する
    var onboardStringArray = ["お気に入りの動物をスワイプしよう！","動画と音楽を合成しよう","動物の最新情報を見よう！"]
    
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
        for i in 0...2{
            
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
        scrollView.contentSize = CGSize(width:screenWidth*3, height:screenHeight-50)
        
        self.view.addSubview(scrollView)
        
        //テキスト反映
        for i in 0...2{
            
            let onboardLabel = UILabel(frame: CGRect(x:CGFloat(i)*view.frame.size.width, y: -225, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            
            
    //フォントの大きさ
    onboardLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
    
    //テキストの配置
    onboardLabel.textAlignment =  .center

    //どのテキストをしようするのか
    onboardLabel.text = onboardStringArray[i]

    //スクロールビューに加える
    scrollView.addSubview(onboardLabel)
    
            
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
