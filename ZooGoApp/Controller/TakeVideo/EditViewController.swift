

import UIKit
import AVKit


class EditViewController: UIViewController {

    
    var url:URL?
    var playerController:AVPlayerViewController?
    var player:AVPlayer?
    var captionString = String()
    var passedURL = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //ナビゲーションバーを消す
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setUPVideoPlayer(url: url!)
        
    }
    
    func setUPVideoPlayer(url:URL){
        
        //動画が被らないように動画を一つにする
        playerController?.removeFromParent()
        player = nil
        player = AVPlayer(url: url)
        self.player?.volume = 1
        view.backgroundColor = .black
        
        //メモリを確保する
        playerController = AVPlayerViewController()
        //[ここのサイズを変えて試してみる]
        //
        //
        playerController?.videoGravity = .resizeAspectFill
        //playerController.viewのフレームを決める
        playerController?.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 100)
        //
        playerController?.showsPlaybackControls = false
        //player = nilにしたものをはめ込む
        playerController?.player = player!
        //
        self.addChild(playerController!)
        //
        self.view.addSubview((playerController?.view)!)
       
        //プレイが終わったら呼ばれるメソッド
        //Notification.Name.AVPlayerItemDidPlayToEndTime
        //(20秒に近付いたらplayerItemDidReachEnd)を呼ぶ
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        
        //キャンセルボタンを設定する
        let cancelButton = UIButton(frame: CGRect(x: 10.0, y: 10.0, width: 30.0, height: 30.0))
        //キャンセルボタンに画像をつける
        cancelButton.setImage(UIImage(named: "cancel"), for: UIControl.State())
        //キャンセルボタンが押された時、touchUpInside(ボタンをタッチして、離した時)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        //キャンセルボタンを加える
        view.addSubview(cancelButton)
        
        player?.play()
       
        
    }
    
    
    @objc func cancel(){
        
        //画面をpopViewControllerで1つ戻る
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
    @objc func playerItemDidReachEnd(_ notification:Notification){
        
        //繰り返し
        if self.player != nil{
            
            //seek(探し求める)動画を0秒まで戻す
            self.player?.seek(to: CMTime.zero)
            //ボリューム0を1.0に設定。(.0〜1.0まである)
            self.player?.volume = 1
            //プレイをする
            self.player?.play()
            
        }
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //selectVC
        //はじめは飛ばされる(非同期処理)
        if segue.identifier == "selectVC"{
            
            //destination(行先)
          let selectVC = segue.destination as!
                SelectMusicViewController
            selectVC.passedURL = url
            
            //いったん飛ばされる
            DispatchQueue.global().async {
                
                //text1とtext2はアーティスト名と楽曲名
                selectVC.resultHandler = { url,text1,text2 in
                    //合成された動画のURL(音楽と動画がされたやつ)
                    self.setUPVideoPlayer(url: URL(string: url)!)
                    //\n改行、
                    //text1,text2はアーティスト名と楽曲名
                    self.captionString = text1 + "\n" + text2
                    self.passedURL = url
                }
                
            }
            //ここ
            
        }
        
        if segue.identifier == "shareVC"{
            
            let shareVC = segue.destination as! ShareViewController
            shareVC.captionString = self.captionString
            shareVC.passedURL = self.passedURL
        
        }
                
    }
    
 
    @IBAction func showSelectVC(_ sender: Any) {
    
        performSegue(withIdentifier: "selectVC", sender: nil)
        
    }
    
    
    //画面遷移
 
    @IBAction func next(_ sender: Any) {
    
    
        //音楽名と楽曲名が空でないならば
        if captionString.isEmpty != true{
            
            player?.pause()
            performSegue(withIdentifier: "shareVC", sender: nil)
        }else{
            
            print("楽曲を選択してください。")
            
        }
     
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
