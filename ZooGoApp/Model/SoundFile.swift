//
//  SoundFile.swift
//  ZooGoApp
//
//  Created by 山﨑隼汰 on 2021/01/23.
//

import AVFoundation

class SoundFile {
    
    var player:AVAudioPlayer?
    
    func playSound(fileName:String,extensionName:String) {
    
    //再生する
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
    
        do {
          
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
        
        
        } catch  {
            
            print("エラーです")
            
        }
        
    }
    
}
