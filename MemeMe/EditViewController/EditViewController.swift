//
//  EditViewController.swift
//  MemeMe
//
//  Created by Jesus Antonio Gil on 11/2/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit

struct Meme {
    var topText: String
    var bottomText: String
    var image: UIImage
    var memeImage: UIImage
}

class EditViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var generalView: UIView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var shareTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var shareBottomConstraint: NSLayoutConstraint!
    
    
    //Inject
    var presenterAssembly: PresenterAssembly!
    var localNotificationManager: LocalNotificationManager!
    
    private var pickerPresenter: PickerPresenter!
    private var sharePresenter: SharePresenter!
    private var animateView: Bool = false
    
    
    //MARK: LIVE CYCLE

    override func viewDidLoad(){
        super.viewDidLoad()
        
        pickerPresenter = presenterAssembly.pickerPresenter(self, viewController: self) as! PickerPresenter
        sharePresenter = presenterAssembly.sharePresenter(self, viewController: self) as! SharePresenter
        
        cameraButton.enabled = pickerPresenter.checkCameraAvailable()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        localNotificationManager.addKeyboardNotificationsObserver(self, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        localNotificationManager.removeObserver(self)
    }

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: NOTIFICATIONS
    
    func keyboardWillShow(notification: NSNotification) {
        if(animateView == true) {
            let userInfo = notification.userInfo!
            let keyboardHeight = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().height
            let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
            
            shareTopConstraint.constant = -keyboardHeight
            shareBottomConstraint.constant = keyboardHeight
            view.needsUpdateConstraints()
            
            UIView.animateWithDuration(animationDuration, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if(animateView == true) {
            let userInfo = notification.userInfo!
            let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
            
            shareTopConstraint.constant = 0.0
            shareBottomConstraint.constant = 0.0
            view.needsUpdateConstraints()
            
            UIView.animateWithDuration(animationDuration, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
                self.view.layoutIfNeeded()
                }, completion: nil)
        }
        animateView = false
    }
    
    
    //MARK: ACTIONS
    
    @IBAction func onCameraButtonTap(sender: AnyObject) {
        pickerPresenter.showPicker(.Camera)
    }
    
    @IBAction func onAlbumButtonTap(sender: AnyObject) {
        pickerPresenter.showPicker(.PhotoLibrary)
    }
    
    @IBAction func onShareButtonTap(sender: AnyObject) {
        view.endEditing(true)
        let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, image: photoImageView.image!, memeImage: sharePresenter.getImageFromView(shareView))
        sharePresenter.shareImage(meme)
    }
    
    @IBAction func onCancelButtonTap(sender: AnyObject) {
        resetEditController()
    }
    
    
    //MARK: PRIVATE
    
    private func resetEditController() {
        cancelButton.enabled = false
        shareButton.enabled = false
        photoImageView.image = nil
        topTextField.text = "TOP"
        bottomTextField.text = "BOTTOM"
        view.endEditing(true)
    }
}

//MARK: UITextField Delegate

extension EditViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if(textField == bottomTextField) {
            animateView = true
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: PickerPresenter Delegate

extension EditViewController: PickerPresenterDelegate {
    
    func presenterCameraImage(image: UIImage, editingInfo: [String : AnyObject]?) {
        photoImageView.image = image
        cancelButton.enabled = true
        shareButton.enabled = true
    }
}

//MARK: SharePresenter Delegate

extension EditViewController: SharePresenterDelegate {
    
    //In this app, SharePresenterDelegate is not neccessary. But, you can use ShrePresenter with other objects.
}
