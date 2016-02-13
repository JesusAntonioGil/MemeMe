//
//  CameraManager.swift
//  MemeMe
//
//  Created by Jesus Antonio Gil on 13/2/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


@objc protocol CameraManagerDelegate {
    optional func cameraDidPhotoWithImage(image: UIImage, editingInfo: [String : AnyObject]?)
}


class CameraManager: NSObject {
    
    //Injected
    var viewController: UIViewController!
    
    var delegate: CameraManagerDelegate!
    private var imagePickerController = UIImagePickerController()
    
    
    //MARK: PUBLIC
    
    func presentCamera(sourceType: UIImagePickerControllerSourceType) {
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = sourceType
        if(sourceType == .Camera) {
           imagePickerController.cameraCaptureMode = .Photo
        }
        viewController.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    class func checkCameraAvailable() -> Bool {
        return UIImagePickerController.isSourceTypeAvailable(.Camera)
    }
}


//MARK: UIImagePickerController & UINavigationController Delegate

extension CameraManager: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        if(delegate != nil) {
            delegate.cameraDidPhotoWithImage!(image, editingInfo: editingInfo)
        }
        
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        if(delegate != nil) {
            viewController.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
