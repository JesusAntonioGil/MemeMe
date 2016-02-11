//
//  PresenterAssembly.swift
//  MemeMe
//
//  Created by Jesus Antonio Gil on 11/2/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit
import Typhoon


class PresenterAssembly: TyphoonAssembly {

    //MARK: PUBLIC
    //MARK: PickerPresenter
    
    internal dynamic func pickerPresenter(delegate: PickerPresenterDelegate) -> AnyObject {
        return TyphoonDefinition.withClass(PickerPresenter.self) {
            (definition) in
                definition.injectProperty("delegate", with: delegate)
        }
    }
    
}
