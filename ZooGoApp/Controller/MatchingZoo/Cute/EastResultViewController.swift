//
//  ResultViewController.swift
//  ZooGoApp
//
//  Created by 山﨑隼汰 on 2021/01/06.
//

import UIKit

class EastResultViewController: UIViewController {

    
    var passedAnimalName = [String]()
    
    var conditions = [(DataSet) -> Bool]()
   
    var resultList: [String] = []
  
    var dataset: [DataSet] = eastCuteData
    
    let zooNameA = UILabel()
    
    let zooNameB = UILabel()
    
    let zooNameC = UILabel()
    
    let zooNameD = UILabel()
    
    let zooNameE = UILabel()
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //ラベルの背景の角を丸くする
        self.titleLabel.layer.cornerRadius = 20.0
        self.titleLabel.clipsToBounds = true
        

        zooNameA.text = ""
        zooNameA.font = UIFont(name: "HiraKakuProN-W6", size: 20)
        self.stackView.addArrangedSubview(zooNameA)
        
        zooNameB.text = ""
        zooNameB.font = UIFont(name: "HiraKakuProN-W6", size: 20)
        self.stackView.addArrangedSubview(zooNameB)
        
        zooNameC.text = ""
        zooNameC.font = UIFont(name: "HiraKakuProN-W6", size: 20)
        self.stackView.addArrangedSubview(zooNameC)
        
        zooNameD.text = ""
        zooNameD.font = UIFont(name: "HiraKakuProN-W6", size: 20)
        self.stackView.addArrangedSubview(zooNameD)
        
        zooNameE.text = ""
        zooNameE.font = UIFont(name: "HiraKakuProN-W6", size: 20)
        self.stackView.addArrangedSubview(zooNameE)
        
        
        
        zooMatching(passedAnimalName: passedAnimalName)
    
        displaylabel(resultList: resultList)
        
        
    }
    
    

    func zooMatching(passedAnimalName:[String] ) {
    
        print(passedAnimalName)
    
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
            
            zooNameB.removeFromSuperview()
            zooNameC.removeFromSuperview()
            zooNameD.removeFromSuperview()
            zooNameE.removeFromSuperview()
        
            zooNameA.font = UIFont(name: "HiraKakuProN-W6", size: 30)
            zooNameA.text = "マッチングできません"
            
        } else if resultList.count == 1 {
            
            stackView.spacing = -3
            
            zooNameB.removeFromSuperview()
            zooNameC.removeFromSuperview()
            zooNameD.removeFromSuperview()
            zooNameE.removeFromSuperview()
        
            zooNameA.font = UIFont(name: "HiraKakuProN-W6", size: 30)
            
            zooNameA.text = resultList[0]
        
        
    }else if resultList.count == 2 {
        
        
        zooNameC.removeFromSuperview()
        zooNameD.removeFromSuperview()
        zooNameE.removeFromSuperview()
        
        zooNameA.font = UIFont(name: "HiraKakuProN-W6", size: 30)
        zooNameB.font = UIFont(name: "HiraKakuProN-W6", size: 30)
      
        zooNameA.text = "1." + resultList[0]
        zooNameB.text = "2." + resultList[1]
        
    }else if resultList.count == 3 {
        
        zooNameD.removeFromSuperview()
        zooNameE.removeFromSuperview()
        
        zooNameA.font = UIFont(name: "HiraKakuProN-W6", size: 20)
        zooNameB.font = UIFont(name: "HiraKakuProN-W6", size: 20)
        zooNameC.font = UIFont(name: "HiraKakuProN-W6", size: 20)
        
        zooNameA.text = "1." + resultList[0]
        zooNameB.text = "2." + resultList[1]
        zooNameC.text = "3." + resultList[2]
        
    }else if resultList.count == 4 {
        
        zooNameE.removeFromSuperview()
        
        zooNameA.text = "1." + resultList[0]
        zooNameB.text = "2." + resultList[1]
        zooNameC.text = "3." + resultList[2]
        zooNameD.text = "4." + resultList[3]
        
    } else if resultList.count >= 5 &&  resultList.count <= 10{
        
    let shuffledParkName = resultList.shuffled().prefix(5)
        
        print(shuffledParkName)
        
        zooNameA.text = "1." + resultList[0]
        zooNameB.text = "2." + resultList[1]
        zooNameC.text = "3." + resultList[2]
        zooNameD.text = "4." + resultList[3]
        zooNameE.text = "5." + resultList[4]
            
    }else{
        
        zooNameA.text = "1." + "旭山動物園"
        zooNameB.text = "2." + "那須どうぶつ王国"
        zooNameC.text = "3." + "多摩動物公園"
        zooNameD.text = "4." + "京都動物園"
        zooNameE.text = "5." + "よこはま動物園ズーラシア"
    
    }
     
    }
     
    
    @IBAction func dismissButton(_ sender: Any) {
   
       
    self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
        
    }

    
}
