//
//  PickerPresenter.swift
//  MemeMe
//
//  Created by Jesus Antonio Gil on 11/2/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


@objc protocol PickerPresenterDelegate {

}


class PickerPresenter: NSObject {

    //Injected
    var delegate: PickerPresenterDelegate!
    
}
