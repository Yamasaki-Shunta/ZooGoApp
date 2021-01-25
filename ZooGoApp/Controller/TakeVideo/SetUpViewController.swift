


import UIKit
import SwiftyCam
import AVFoundation
import MobileCoreServices


//ライブラリの画面を使っていく(SwiftyCamViewController)
//UINavigationControllerDelegate→ カメラを使用する
class SetUpViewController: SwiftyCamViewController,SwiftyCamViewControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    
    var videoURL:URL?
    
    var soundFile = SoundFile()
    
    @IBOutlet weak var captureButton: SwiftyRecordButton!
    
    @IBOutlet weak var flipCameraButton: UIButton!
    
    //SwiftyCamViewControllerのプロパティにアクセス
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //設定を行いますか？
        shouldPrompToAppSettings = true
        //SwiftyCamViewControllerDelegateを自分に設定する
        cameraDelegate = self
        //レコードボタンを押して何秒間撮影をするか
        maximumVideoDuration = 20.0
        //デバイスの傾きを使用するしますか？
        shouldUseDeviceOrientation = false
        //自動回転を許可する
        allowAutoRotate = false
        //動画を撮影した音を消す
        audioEnabled = false
        //キャプチャーボタンを有効にしますか？
        captureButton.buttonEnabled = true
        //デリゲートメソッドを自分に設定する
        captureButton.delegate = self
        //スワイプズームを有効にする
        swipeToZoomInverted = true
    
    }
    
    //ナビゲーションバーを消す
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
        
    //アルバムの許可画面を出して、キャンセルされた場合の設定
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //URL型としてアルバムからメディアを取得する
        let mediaURL = info[.mediaURL] as? URL
        videoURL = mediaURL
        
        //pickerviewを閉じる
        picker.dismiss(animated: true, completion: nil)
        
        //値を渡しながら画面遷移
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let editVC = storyboard.instantiateViewController(withIdentifier: "EditVC") as! EditViewController


        editVC.url = videoURL
        self.navigationController?.pushViewController(editVC, animated: true)
        
    }
    
    //ステータスバーを表示するかしないか
    override var prefersStatusBarHidden: Bool {
           return true
    }

    //キャプチャーボタンでデリゲートメソッドを使用するのか？
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        captureButton.delegate = self
    }
    
    //キャプチャーボタンをずっと使えるようにする
    func swiftyCamSessionDidStartRunning(_ swiftyCam: SwiftyCamViewController) {
        print("Session did start running")
        captureButton.buttonEnabled = true
    }
    
    //終わったらキャプチャーボタンを使えないようにする
    func swiftyCamSessionDidStopRunning(_ swiftyCam: SwiftyCamViewController) {
        print("Session did stop running")
        captureButton.buttonEnabled = false
    }
    
    //ビデオのレコーディングが始まったら呼ばれる
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didBeginRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
       
        print("Did Begin Recording")
        captureButton.growButton()
        soundFile.playSound(fileName: "録画ボタン", extensionName: "mp3")
        hideButtons()
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishRecordingVideo camera: SwiftyCamViewController.CameraSelection) {
        
        print("Did finish Recording")
        captureButton.shrinkButton()
        showButtons()
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFinishProcessVideoAt url: URL) {
        
        //ここで撮影後生成されたURLが入っていくる
        print(url.debugDescription)
        
        //値を渡しながら画面遷移
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let editVC = storyboard.instantiateViewController(withIdentifier: "EditVC") as! EditViewController
        videoURL = url
        editVC.url = videoURL
        self.navigationController?.pushViewController(editVC, animated: true)
        
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFocusAtPoint point: CGPoint) {
        print("Did focus at point: \(point)")
  
    }
    
    func swiftyCamDidFailToConfigure(_ swiftyCam: SwiftyCamViewController) {
        let message = NSLocalizedString("Unable to capture media", comment: "Alert message when something goes wrong during capture session configuration")
        let alertController = UIAlertController(title: "AVCam", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Alert OK button"), style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didChangeZoomLevel zoom: CGFloat) {
        print("Zoom level did change. Level: \(zoom)")
        print(zoom)
        
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didSwitchCameras camera: SwiftyCamViewController.CameraSelection) {
        print("Camera did change to \(camera.rawValue)")
        print(camera)
    }
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didFailToRecordVideo error: Error) {
        print(error)
    }
    
    func hideButtons() {
        UIView.animate(withDuration: 0.25) {
            self.flipCameraButton.alpha = 0.0
        }
    }
    
    func showButtons() {
        UIView.animate(withDuration: 0.25) {
            self.flipCameraButton.alpha = 1.0
        }
    }
    
    //ズーム
    func focusAnimationAt(_ point: CGPoint) {
        
        let focusView = UIImageView(image: #imageLiteral(resourceName: "focus"))
        focusView.center = point
        focusView.alpha = 0.0
        view.addSubview(focusView)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseInOut, animations: {
            focusView.alpha = 1.0
            focusView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        }) { (success) in
            UIView.animate(withDuration: 0.15, delay: 0.5, options: .curveEaseInOut, animations: {
                focusView.alpha = 0.0
                focusView.transform = CGAffineTransform(translationX: 0.6, y: 0.6)
            }) { (success) in
                focusView.removeFromSuperview()
           
            }
        }
    }
    
    @IBAction func openAlbum(_ sender: Any) {
    
        //アルバムの設定[動画のみが閲覧できるアルバムを起動]
        //インスタンス化
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .savedPhotosAlbum
        //動画だけ抽出する
        imagePickerController.mediaTypes = ["public.movie"]
        //編集させない
        imagePickerController.allowsEditing = false
        //この設定内容を表示させる
        present(imagePickerController, animated: true, completion: nil)
   
    }
    
    @IBAction func cameraSwitchTapped(_ sender: Any) {
        switchCamera()
    
    }
    
    @IBAction func backButton(_ sender: Any) {
        
    self.navigationController?.popViewController(animated: true)
    
    }
    
    
}

