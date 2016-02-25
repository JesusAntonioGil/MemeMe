//
//  ActivityManager.swift
//  MemeMe
//
//  Created by Jesus Antonio Gil on 13/2/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit
import QuartzCore


class ActivityManager: NSObject {

    //Injected
    var viewController: UIViewController!
    
    
    //MARK: PUBLIC
    
    func shareImage(meme: Meme) {
        let shareItems = [meme.memeImage]
        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityTypePrint, UIActivityTypePostToWeibo, UIActivityTypeCopyToPasteboard, UIActivityTypeAddToReadingList, UIActivityTypePostToVimeo]
        viewController.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    class func getImageFromView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let img: UIImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    }
}
