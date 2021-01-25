

import UIKit
import SDWebImage
import AVFoundation
import SwiftVideoGenerator
//SwiftVideoGenerator:音声と動画を合成させるライブラリ


class SelectMusicViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,MusicProtocol {
    
    var musicModel = MusicModel()
    var player:AVAudioPlayer?
    var videoPath = String()
    var passedURL:URL?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    //遷移元から処理を受け取るクロージャーのプロパティーを用意
    var resultHandler:((String,String,String)->Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        searchTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicModel.artistNameArray.count
    }
    
    
    //テーブルビューを管理する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //ハイライトを消す
        cell.isHighlighted = false
        
        //タグで管理している
        let artWorkImageView = cell.contentView.viewWithTag(1) as! UIImageView
        let musicNameLabel = cell.contentView.viewWithTag(2) as! UILabel
        let artistNameLabel = cell.contentView.viewWithTag(3) as! UILabel
        
        //テーブルに反映させる
        artWorkImageView.sd_setImage(with: URL(string: musicModel.artworkUrl100Array[indexPath.row]), completed: nil)
      
        musicNameLabel.text = musicModel.trackCensoredNameArray[indexPath.row]
       
        artistNameLabel.text = musicModel.artistNameArray[indexPath.row]
        
        //お気に入りボタンを作る
        let favButton = UIButton(frame: CGRect(x: 318, y: 41, width: 40, height: 33))
        //画像をつける
        favButton.setImage(UIImage(named: "fav"), for: .normal)
        //お気に入りボタンを押したときのメソッド(addTarge) タップして指を離したときに
        favButton.addTarget(self, action: #selector(favButtonTap(_:)), for: .touchUpInside)
        
        //
        favButton.tag = indexPath.row
        cell.contentView.addSubview(favButton)
        
        //プレイボタンを作成する
        let playButton = UIButton(frame: CGRect(x: 20, y: 15, width: 100, height: 100))
        //画像をつける
        playButton.setImage(UIImage(named: "play"), for: .normal)
        
        //(_:)引数を持たせて、他のところでも使えるようにする
        playButton.addTarget(self, action:  #selector(playButtonTap(_:)), for: .touchUpInside)
        playButton.tag = indexPath.row
        cell.contentView.addSubview(playButton)
        
        return cell
        
    }
    
    
    //リターンボタンが押された時
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        refleshData()
        textField.resignFirstResponder()
        
        return true
        
    }
    
    
    //テーブルビューのセルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
   
    }
    
   
    @objc func favButtonTap(_ sender:UIButton){
        
        //音声が流れている時、止める
        
        if player?.isPlaying == true{
            
            player?.stop()
            
        }
        
        //動画と音声を合成する(一定時間かかる)
       
        //loadingViewを出す
        LoadingView.lockView()
        
        VideoGenerator.fileName = "newAudioMovie"
        VideoGenerator.current.mergeVideoWithAudio(videoUrl: passedURL!, audioUrl: URL(string: self.musicModel.preViewUrlArray[sender.tag])!) { (result) in
            
            //ローディングビューを閉じる
            LoadingView.unlockView()
            
            
            switch result{
            
            //urlの中に値が入ってくる
            case .success(let url):
                
                
                self.videoPath = url.absoluteString
                if let handler = self.resultHandler{
                    
                    //入力値を引数として渡された処理の実行
                    //処理の内容だけ遷移先に渡されていて、実行されるのは戻ったときEditVCの中に値が入ったとき(クロージャーだから)
                    handler(self.videoPath,self.musicModel.artistNameArray[sender.tag],self.musicModel.trackCensoredNameArray[sender.tag])
                    
                }
                
                self.dismiss(animated: true, completion: nil)
            
            case .failure(let error):
                
                print(error)
            }
            
        }
        
        
        
        //合成ができたら値を渡しながら画面を戻る
        
    }
    
    
    @objc func playButtonTap(_ sender:UIButton){
        print(sender.tag)
        print(sender.debugDescription)
        
        //音楽を止める
        
        if player?.isPlaying == true{
            
            player!.stop()
        }
        
        
        let url = URL(string: musicModel.preViewUrlArray[sender.tag])
        print(url?.debugDescription)
        downLoadMusicURL(url: url!)
        
    }
    
    
    func downLoadMusicURL(url:URL){
        
        var dowloadTask:URLSessionDownloadTask
        dowloadTask = URLSession.shared.downloadTask(with: url, completionHandler: { (url, response, error) in
            
            
            print(response!)
            self.play(url: url!)
            
            
        })
        
        dowloadTask.resume()
        
        
    }
    
    
    func play(url:URL){
        
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            //prepareToPlayというのは、playための準備のこと
            player?.prepareToPlay()
            player?.volume = 1.0
            player?.play()
        
        
        } catch let error as NSError {
            
            print(error.debugDescription)
            
        }
        
        
    }
    
    
    func catchData(count: Int) {
        
        if count == 1{
            
            tableView.reloadData()
      
        }
    }
    
    
    func refleshData(){
        
        //サーチテキストがからでないのであれば
        if searchTextField.text?.isEmpty != nil{
          
        //アーティスト名は数字が入る場合があるので、string型にキャストする
            let urlString = "https://itunes.apple.com/search?term=\(String(describing:searchTextField.text!))&entity=song&country=jp"
            
            
            //コンピューターが日本語を読めるようにしてあげる
            let encodeUrlString:String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            
            
            musicModel.musicDelegate = self
            //50件取得する
            musicModel.setData(resultCount: 50, encodeUrlString: encodeUrlString)
            //キーボードを閉じる
            searchTextField.resignFirstResponder()
            
        }
        
        
    }
    
    
    @IBAction func searchAction(_ sender: Any) {
        
        refleshData()
        
    }
    


}
