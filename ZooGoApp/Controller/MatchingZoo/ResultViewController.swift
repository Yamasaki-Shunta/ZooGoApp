//
//  ResultViewController.swift
//  ZooGoApp
//
//  Created by 山﨑隼汰 on 2021/01/06.
//

import UIKit

class ResultViewController: UIViewController {

    
    var passedAnimalName = [String]()
    
    var conditions = [(DataSet) -> Bool]()
   
    var resultList: [String] = []
  
    var dataset: [DataSet] = eastCuteData
    
    @IBOutlet weak var zooParkName1: UILabel!
    
    @IBOutlet weak var zooParkName2: UILabel!
    
    @IBOutlet weak var zooParkName3: UILabel!
    
    @IBOutlet weak var zooParkName4: UILabel!
    
    @IBOutlet weak var zooParkName5: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //ラベルの背景の角を丸くする
        self.titleLabel.layer.cornerRadius = 20.0
        self.titleLabel.clipsToBounds = true
        
        zooMatching(passedAnimalName: passedAnimalName)
    
        displaylabel(resultList: resultList)
        
    }
    

    func zooMatching(passedAnimalName:[String] ) {
    
        print(passedAnimalName)
        
    //contains：抽出
    //animalNameとpassedAnimalNameに含まれる要素を抽出
     
    for filterWord in passedAnimalName {

    conditions.append{$0.animalName.contains(filterWord)
    
        }
     }
    
    let filteredData = dataset.filter { element in conditions.reduce(false){$0 != $1(element)}
      
    }
        
       print(filteredData)
        
        filteredData.forEach ({ element in
            
         resultList.append(element.parkName)
            
        
        })
    
    }
    
    
    func displaylabel(resultList:[String]) {
        
        print(resultList)
        
        if resultList.count == 0 {
            zooParkName3.text = "マッチングできません "
            
        } else if resultList.count == 1 {
            
        zooParkName3.text = resultList[0]
        
        
    }else if resultList.count == 2 {
      
        zooParkName1.text = resultList[0]
        zooParkName2.text = resultList[1]
        
    }else if resultList.count == 3 {
        
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
    
    }else if resultList.count > 5 &&  resultList.count <= 10{
        
    let shuffledParkName = resultList.shuffled().prefix(5)
        
        print(shuffledParkName)
        
        zooParkName1.text = shuffledParkName[0]
        zooParkName2.text = shuffledParkName[1]
        zooParkName3.text = shuffledParkName[2]
        zooParkName4.text = shuffledParkName[3]
        zooParkName5.text = shuffledParkName[4]
            
    }else{
        
        zooParkName1.text = "旭山動物園"
        zooParkName2.text = "那須どうぶつ王国"
        zooParkName3.text = "多摩動物公園"
        zooParkName4.text = "京都動物園"
        zooParkName5.text = "よこはま動物園ズーラシア"
    
    }
     
    }
     
    
    @IBAction func dismissButton(_ sender: Any) {
   
       
    self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
        
    }

    
}
