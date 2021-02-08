

import UIKit
import AVKit
import Photos

class ShareViewController: UIViewController {
    
    
    var captionString = String()
   
    var passedURL = String()
   
    var player:AVPlayer?
   
    var playerController:AVPlayerViewController?
    
    @IBOutlet weak var textView: PlaceHolderTextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       //キーボードの高さの調節
        let notification = NotificationCenter.default
        
        notification.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        notification.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //完成された動画URLの再生(passedURL)
        setUPVideoPlayer(url: URL(string: passedURL)!)
        
    }
    
    func setUPVideoPlayer(url:URL){
           
           self.view.backgroundColor = UIColor.black
           playerController?.removeFromParent()
           player = AVPlayer(url: url)
           self.player?.volume = 1
          
           playerController = AVPlayerViewController()
        playerController!.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height-225)
        
           playerController?.videoGravity = .resizeAspectFill
           playerController!.showsPlaybackControls = false
           playerController!.player = player!
           self.addChild(playerController!)
           self.view.addSubview(playerController!.view)
           

           NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player!.currentItem)

           player?.play()

       }
    
    @objc func playerItemDidReachEnd(_ notification:Notification){
        
        //繰り返し
        if self.player != nil{
            
            self.player?.seek(to: CMTime.zero)
            self.player?.volume = 1
            self.player?.play()
            
        }
        
    }
       
    //タッチでキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      
        textView.resignFirstResponder()
  
    }
    
    @IBAction func savePhotoLibrary(_ sender: Any) {
        
        //completionHandler = 結果
        
        PHPhotoLibrary.shared().performChanges {
            PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: URL(string: self.passedURL)!)
        } completionHandler: { (result, error) in
            
            if error != nil{
                
                print(error.debugDescription)
                return
           
            }
            
            if result{
             
                DispatchQueue.main.async {
                    
                    Alert.okAlert(vc: self, title: "動画を保存しました", message: "素敵な動画ができましたね")
                      
                }
                
                print("保存されました")
            
            }
            
        }
        
     }

    @IBAction func home(_ sender: Any) {
    
        player?.pause()
        player = nil
        
        //一番最初の画面に戻る
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    @IBAction func share(_ sender: Any) {
        
        //アクティビティーViewにItemを掲載する、Share
        let activityItems = [URL(string: passedURL) as Any,"\(textView.text!)\n\(captionString)\n#ZooGo"] as [Any]
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        activityController.popoverPresentationController?.sourceView = self.view
        activityController.popoverPresentationController?.sourceRect = self.view.frame
        
        self.present(activityController, animated: true, completion: nil)
        
    }
    
    //キーボードの高さの調節
    @objc func keyboardWillShow(notification: Notification?) {
        let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
        UIView.animate(withDuration: duration!) {
            self.view.transform = CGAffineTransform(translationX: 0, y: -(rect?.size.height)!)
        }
        
    }
    
    //キーボードの高さの調節
    @objc func keyboardWillHide(notification: Notification?) {
        let duration: TimeInterval? = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double
        UIView.animate(withDuration: duration!) {
            self.view.transform = CGAffineTransform.identity
       
        }
        
    }
    
}
