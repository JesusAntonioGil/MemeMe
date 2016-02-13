//
//  PickerPresenter.swift
//  MemeMe
//
//  Created by Jesus Antonio Gil on 11/2/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


@objc protocol PickerPresenterDelegate {

    func presenterCameraImage(image: UIImage, editingInfo: [String : AnyObject]?)
}


class PickerPresenter: NSObject {

    //Injected
    var delegate: PickerPresenterDelegate!
    var cameraManager: CameraManager!
    
    
    //MARK: PUBLIC
    
    func showPicker(sourceType: UIImagePickerControllerSourceType){
        cameraManager.delegate = self
        cameraManager.presentCamera(sourceType)
    }
    
    func checkCameraAvailable() -> Bool {
        return CameraManager.checkCameraAvailable()
    }
}


//MARK: CameraManager Delegate

extension PickerPresenter: CameraManagerDelegate {
    
    func cameraDidPhotoWithImage(image: UIImage, editingInfo: [String : AnyObject]?) {
        delegate.presenterCameraImage(image, editingInfo: editingInfo)
    }
}
