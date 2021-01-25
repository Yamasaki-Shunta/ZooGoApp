

import UIKit

class SwipeAnimalViewController: UIViewController {

    
    var swipedAnimalName = [String]()
    
    let zooNameA = UILabel()
    
    let zooNameB = UILabel()
    
    let zooNameC = UILabel()
    
    let zooNameD = UILabel()
    
    let zooNameE = UILabel()
    
    var selectData:[DataSet] = []
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(swipedAnimalName)
        
        displaylabel(animalName:swipedAnimalName)
        
    }
    
    func displaylabel(animalName:[String]) {
    
    zooNameA.font = UIFont(name: "HiraKakuProN-W6", size: 18)
    zooNameB.font = UIFont(name: "HiraKakuProN-W6", size: 18)
    zooNameC.font = UIFont(name: "HiraKakuProN-W6", size: 18)
    zooNameD.font = UIFont(name: "HiraKakuProN-W6", size: 18)
    zooNameE.font = UIFont(name: "HiraKakuProN-W6", size: 18)
        
    if animalName.count == 1 {
            
            zooNameA.text = animalName[0]
            
            self.stackView.addArrangedSubview(zooNameA)
        
        
    }else if animalName.count == 2 {
        
        zooNameA.text = "1." + animalName[0]
        zooNameB.text = "2." + animalName[1]
        
        self.stackView.addArrangedSubview(zooNameA)
        self.stackView.addArrangedSubview(zooNameB)
        
    }else if animalName.count == 3 {
       
        zooNameA.text = "1." + animalName[0]
        zooNameB.text = "2." + animalName[1]
        zooNameC.text = "3." + animalName[2]
        
        self.stackView.addArrangedSubview(zooNameA)
        self.stackView.addArrangedSubview(zooNameB)
        self.stackView.addArrangedSubview(zooNameC)
        
    }else if animalName.count == 4 {
    
       
        zooNameA.text = "1." + animalName[0]
        zooNameB.text = "2." + animalName[1]
        zooNameC.text = "3." + animalName[2]
        zooNameD.text = "4." + animalName[3]
        
        self.stackView.addArrangedSubview(zooNameA)
        self.stackView.addArrangedSubview(zooNameB)
        self.stackView.addArrangedSubview(zooNameC)
        self.stackView.addArrangedSubview(zooNameD)
        
        
    } else if animalName.count == 5 {
        
        zooNameA.text = "1." + animalName[0]
        zooNameB.text = "2." + animalName[1]
        zooNameC.text = "3." + animalName[2]
        zooNameD.text = "4." + animalName[3]
        zooNameE.text = "5." + animalName[4]
        
        self.stackView.addArrangedSubview(zooNameA)
        self.stackView.addArrangedSubview(zooNameB)
        self.stackView.addArrangedSubview(zooNameC)
        self.stackView.addArrangedSubview(zooNameD)
        self.stackView.addArrangedSubview(zooNameE)
            
    }
     
    }
    
    
    @IBAction func ScreenTransition(_ sender: Any) {

        performSegue(withIdentifier: "resultVC", sender: nil)
    
    }
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if segue.identifier == "resultVC" {
        
        let ResultVC = segue.destination as! ResultViewController
       
        ResultVC.passedAnimalName = swipedAnimalName
       
        ResultVC.passedDataSet = selectData
        
      }
        
    }
    
    @IBAction func dismissButton(_ sender: Any) {

        self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
}
