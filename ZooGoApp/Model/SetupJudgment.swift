//
//
//  ZooGoApp
//
//  Created by 山﨑隼汰 on 2021/01/14.
//

import Foundation

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

