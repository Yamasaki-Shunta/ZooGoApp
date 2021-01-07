//
//  ResultViewController.swift
//  ZooGoApp
//
//  Created by 山﨑隼汰 on 2021/01/06.
//

import UIKit

class ResultViewController: UIViewController {


    struct AnimalDataSet {
        
        var animalName: String
        var parkName : String
  
    }
    
    var passedAnimalNameArray = [String]()
    var resultList = [String]()


    
    @IBOutlet weak var zooParkName1: UILabel!
    
    
    @IBOutlet weak var zooParkName2: UILabel!
    
    
    @IBOutlet weak var zooParkName3: UILabel!
    
    
    @IBOutlet weak var zooParkName4: UILabel!
    
    
    @IBOutlet weak var zooParkName5: UILabel!
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(passedAnimalNameArray)
        
        //ラベルの背景の角を丸くする
        self.titleLabel.layer.cornerRadius = 20.0
        
        self.titleLabel.clipsToBounds = true
        
        zooMatching(passedAnimalNameArray:passedAnimalNameArray)
    
    }
    
   
    func zooMatching(passedAnimalNameArray:[String]){
   
        print(passedAnimalNameArray)
        
   if passedAnimalNameArray.count <= 5 {
            
    for animalNames in passedAnimalNameArray{
                
    if animalNames == "ホッキョクグマ" {
                      
    resultList.append("円山動物園")
                    
    }else if animalNames == "スナネコ" {
                    
    resultList.append("那須どうぶつ王国")
                    
     }else if animalNames == "レッサーパンダ"{
            
    resultList.append("八木山動物園")
            
    }else if animalNames == "オウサマペンギン"{
                        
    resultList.append("旭山動物園")
                        
    }else if animalNames == "ワオキツネザル" {
                    
    resultList.append("東武動物公園")
                    
    }else if animalNames == "ベアードバク" {
                    
    resultList.append("金沢動物園")
                    
                    
    }else if animalNames == "シロサイ" {
                    
    resultList.append("群馬サファリパーク")
                    
                    
    }else if animalNames == "アムールトラ" {
                    
    resultList.append("宇都宮動物園")
                    
    }else if animalNames == "ゴリラ" {
                    
    resultList.append("東山動物園")
                    
    }else if animalNames == "カピバラ"{
                    
    resultList.append("伊豆シャボテン動物公園")
                
    }else if animalNames == "タスマニアデビル"{
                    
    resultList.append("多摩動物公園")
                    
    }else if animalNames == "コアラ" {
                    
    resultList.append("埼玉こども動物自然公園")
                    
    }else if animalNames == "エゾヒグマ"{
                    
    resultList.append("日立市かみね動物園")
                    
    }else if animalNames == "パンダ"{
                    
    resultList.append("上野動物園")
                    
        }

    }
    
    print(resultList)
   
    
    if resultList.count == 0 {
        
        zooParkName3.text = "マッチングできません"
    
    } else if resultList.count == 1  {
     
        zooParkName3.text = resultList[0]
    
    } else if resultList.count == 2 {
        
        zooParkName1.text = resultList[0]
        zooParkName2.text = resultList[1]
        
    } else if resultList.count == 3 {
        
        zooParkName1.text = resultList[0]
        zooParkName2.text = resultList[1]
        zooParkName3.text = resultList[2]
        
        
    }else if resultList.count == 4 {
        
        zooParkName1.text = resultList[0]
        zooParkName2.text = resultList[1]
        zooParkName3.text = resultList[2]
        zooParkName4.text = resultList[3]
        
    }else if resultList.count == 5 {
        
        zooParkName1.text = resultList[0]
        zooParkName2.text = resultList[1]
        zooParkName3.text = resultList[2]
        zooParkName4.text = resultList[3]
        zooParkName5.text = resultList[4]
    }

   }

    if passedAnimalNameArray.count <= 10 && passedAnimalNameArray.count > 5 {
                
    let getZooName = passedAnimalNameArray.shuffled().prefix(5)
         
         print(getZooName)
         
     for animalNames in getZooName {
                     
         if animalNames == "ホッキョクグマ" {
                           
         resultList.append("円山動物園")
                         
         }else if animalNames == "スナネコ" {
                         
         resultList.append("那須どうぶつ王国")
                         
          }else if animalNames == "レッサーパンダ"{
                 
         resultList.append("八木山動物園")
                 
         }else if animalNames == "オウサマペンギン"{
                             
         resultList.append("旭山動物園")
                             
         }else if animalNames == "ワオキツネザル" {
                         
         resultList.append("東武動物公園")
                         
         }else if animalNames == "ベアードバク" {
                         
         resultList.append("金沢動物園")
                         
                         
         }else if animalNames == "シロサイ" {
                         
         resultList.append("群馬サファリパーク")
                         
                         
         }else if animalNames == "アムールトラ" {
                         
         resultList.append("宇都宮動物園")
                         
         }else if animalNames == "ゴリラ" {
                         
         resultList.append("東山動物園")
                         
         }else if animalNames == "カピバラ"{
                         
         resultList.append("伊豆シャボテン動物公園")
                     
         }else if animalNames == "タスマニアデビル"{
                         
         resultList.append("多摩動物公園")
                         
         }else if animalNames == "コアラ" {
                         
         resultList.append("埼玉こども動物自然公園")
                         
         }else if animalNames == "エゾヒグマ"{
                         
         resultList.append("日立市かみね動物園")
                         
         }else if animalNames == "パンダ"{
                         
         resultList.append("上野動物園")
                         
             }

         }
         
         print(resultList)
        
         
         if resultList.count == 0 {
             
             zooParkName3.text = "マッチングできません"
         
         } else if resultList.count == 1  {
          
             zooParkName3.text = resultList[0]
         
         } else if resultList.count == 2 {
             
             zooParkName1.text = resultList[0]
             zooParkName2.text = resultList[1]
             
         } else if resultList.count == 3 {
             
             zooParkName1.text = resultList[0]
             zooParkName2.text = resultList[1]
             zooParkName3.text = resultList[2]
             
             
         }else if resultList.count == 4 {
             
             zooParkName1.text = resultList[0]
             zooParkName2.text = resultList[1]
             zooParkName3.text = resultList[2]
             zooParkName4.text = resultList[3]
             
         }else if resultList.count == 5 {
             
             zooParkName1.text = resultList[0]
             zooParkName2.text = resultList[1]
             zooParkName3.text = resultList[2]
             zooParkName4.text = resultList[3]
             zooParkName5.text = resultList[4]
         }
     }

if  passedAnimalNameArray.count <= 15 && passedAnimalNameArray.count > 10 {
    
    zooParkName1.text = "旭山動物園"
    zooParkName2.text  = "那須どうぶつ王国"
    zooParkName3.text = "多摩動物公園"
    zooParkName4.text = "京都動物園"
    zooParkName5.text = "よこはま動物園ズーラシア"
    
    
        }
    
    }
      
    
    @IBAction func dismissButton(_ sender: Any) {
   
       
    self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
        
    }

}
