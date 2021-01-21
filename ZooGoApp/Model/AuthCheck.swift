

import Foundation
import Photos

class AuthCheck {
    
    func cameraCheck(){
        
        // ユーザーに許可を促す.
        PHPhotoLibrary.requestAuthorization { (status) -> Void in
            
            switch(status){
            case .authorized:
                print("Authorized")
                
            case .denied:
                print("Denied")
                
            case .notDetermined:
                print("NotDetermined")
                
            case .restricted:
                print("Restricted")
            @unknown default:
                return
            }
            
        }
        
    }
    
}
