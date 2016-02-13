//
//  SharePresenter.swift
//  MemeMe
//
//  Created by Jesus Antonio Gil on 13/2/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


@objc protocol SharePresenterDelegate {
    
}


class SharePresenter: NSObject {

    //Injected
    var delegate: PickerPresenterDelegate!
    var activityManager: ActivityManager!
    
    
    //MARK: PUBLIC
    
    func shareImage(image: UIImage) {
        activityManager.shareImage(image)
    }
    
    func getImageFromView(view: UIView) -> UIImage {
        return ActivityManager.getImageFromView(view)
    }
}
