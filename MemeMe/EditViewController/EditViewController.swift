//
//  EditViewController.swift
//  MemeMe
//
//  Created by Jesus Antonio Gil on 11/2/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


class EditViewController: UIViewController {
    
    //Inject
    var presenterAssembly: PresenterAssembly!
    
    private var pickerPresenter: PickerPresenter!
    
    
    //MARK: LIVE CYCLE

    override func viewDidLoad(){
        super.viewDidLoad()
        
        pickerPresenter = presenterAssembly.pickerPresenter(self) as! PickerPresenter
    }

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
    
}

extension EditViewController: PickerPresenterDelegate {
    
}
