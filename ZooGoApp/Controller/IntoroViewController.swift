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
    var onboardStringArray = ["あなたの最適な動物園を見つけよう！","最新情報をチェックしよう!","動画を撮影してSNSにシェアしよう!"]
    
    
    @IBOutlet weak var scrollView: UIScrollView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ページジングができるようになる
        scrollView.isPagingEnabled = true
        
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
        
       
    }
    
    
    //ナビゲーションバーを消す
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }

    func setUpScroll(){
        
        //scrollViewのdelegateを自分に持ってくる
        scrollView.delegate = self
        
        //スクロール稼働の領域を決める
        scrollView.contentSize = CGSize(width: view.frame.size.width*3.05, height: scrollView.frame.size.height)
        
        //テキスト反映
        for i in 0...2{
            
            let onboardLabel = UILabel(frame: CGRect(x: CGFloat(i)*view.frame.size.width, y: -225, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
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
  

}
