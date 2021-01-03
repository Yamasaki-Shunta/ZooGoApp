//
//   backsystem.swift
//  ZooGoApp
//
//  Created by 山﨑隼汰 on 2021/01/03.
//

import UIKit

extension UIViewController{
   
   func setSwipeBack(){
   let target = self.navigationController?.value(forKey: "_cachedInteractionController")
   let recognizer = UIPanGestureRecognizer(target: target, action:Selector(("handleNavigationTransition:")))
       self.view.addGestureRecognizer(recognizer)
   
   }
   
}
