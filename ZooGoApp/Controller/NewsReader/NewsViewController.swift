//
//  NewsViewController.swift
//  NewsTest
//
//  Created by 山﨑隼汰 on 2020/11/24.
//

import UIKit
import SegementSlide

class NewsViewController: SegementSlideDefaultViewController{
    
    
    override func viewDidLoad() {

    super.viewDidLoad()

      reloadData()

    defaultSelectedIndex = 0
        
    }

    override func segementSlideHeaderView() -> UIView {

    let headerView = UIImageView()

    headerView.isUserInteractionEnabled = true

    headerView.contentMode = .scaleAspectFill

    headerView.image = UIImage(named: "header")

    headerView.translatesAutoresizingMaskIntoConstraints = false
        

    let headerHeight: CGFloat
    
    headerHeight = view.bounds.height/5+view.safeAreaInsets.top

    headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true

   return headerView

    }
    
    override var titlesInSwitcher: [String] {
        
        return ["朝日新聞のどうぶつ新聞"]
        
    }
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        
        return PageViewController()
    
        }

    }
