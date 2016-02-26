//
//  UserDefaultsManager.swift
//  MemeMe
//
//  Created by Jesus Antonio Gil on 26/2/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


let kImagesUserDefaults = "ImagesUserDefaults"


class UserDefaultsManager: NSObject {

    //Injected
    var userDefaults: NSUserDefaults!
    
    
    func saveImage(image: UIImage) {
        let arrayImages: [NSData]!
        if(userDefaults.objectForKey(kImagesUserDefaults) != nil) {
            arrayImages = userDefaults.objectForKey(kImagesUserDefaults) as! Array
        } else {
            arrayImages = Array()
        }
        
        arrayImages.append(NSKeyedArchiver.archivedDataWithRootObject(UIImageJPEGRepresentation(image, 0.5)!))
        
        userDefaults.setObject(arrayImages, forKey: kImagesUserDefaults)
        userDefaults.synchronize()
    }
}
