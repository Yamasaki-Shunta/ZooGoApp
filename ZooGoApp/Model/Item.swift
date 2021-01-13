//
//  Item.swift
//  NewsTest
//
//  Created by 山﨑隼汰 on 2020/11/24.
//

import Foundation


class NewsItems {
    
    var title:String?
    var url:String?
    var pubDate:String?

}

func setup() {
    //UserDefaults.standard.set(false, forKey: "visit") //リセット用
    let visit = UserDefaults.standard.bool(forKey: "visit")
    if visit {
        //二回目以降
        print("二回目以降")
    } else {
        //初回アクセス
        print("初回起動")
        UserDefaults.standard.set(true, forKey: "visit")
    }
}


