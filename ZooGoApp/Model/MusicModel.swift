

import Foundation
import SwiftyJSON
import Alamofire
import UIKit


protocol MusicProtocol {
    
    
    func catchData(count:Int)
    
    func searchData(count:Int)
    
}


class MusicModel: UIViewController{
    

    //アーティスト名
    var artistNameArray = [String]()
    //曲名
    var trackCensoredNameArray = [String]()
    //音源URL
    var preViewUrlArray = [String]()
    //ジャケ写
    var artworkUrl100Array = [String]()
    
    var musicDelegate:MusicProtocol?
    
    
  
    //通信Alamofire
    //JSON解析
    
    func setData(resultCount:Int,encodeUrlString:String){
        
        //通信
        AF.request(encodeUrlString, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            //responseに値が入ったらここが読まれる
            //値を空にする(removeAll)
            self.artistNameArray.removeAll()
            self.trackCensoredNameArray.removeAll()
            self.preViewUrlArray.removeAll()
            self.artworkUrl100Array.removeAll()
            
            print(response)
            
            switch response.result{
            
              case .success:
                
                do {
                  
                    let json:JSON = try JSON(data: response.data!)
                   
                    //-1がないと51回読まれることになる
                    for i in 0...resultCount - 1{
                        print(i)
                        
                        //検索がヒットしないと下に行かないのようにする
                        if json["results"][i]["artistName"].string == nil{
                            
                            
                            self.musicDelegate?.searchData(count: 1)
                            print("ヒットしませんでした")
                            
                            return
                            
                            
                        }
                        
                        self.artistNameArray.append(json["results"][i]["artistName"].string!)
                        self.trackCensoredNameArray.append(json["results"][i]["trackCensoredName"].string!)
                        self.preViewUrlArray.append(json["results"][i]["previewUrl"].string!)
                        self.artworkUrl100Array.append(json["results"][i]["artworkUrl100"].string!)
                    
                    
                    }
                    
                    //全てのデータが取得完了している状態
                    //テーブルビューの更新する
                    self.musicDelegate?.catchData(count: 1)
                    
                } catch  {
            
                }
             
                break
              
            case .failure(_): break
                
            }
            
        }
    
        
    }
    
    
}
