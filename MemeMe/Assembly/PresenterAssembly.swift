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

    //Injected
    var commonAssembly: CommonAssembly!
    
    
    //MARK: PUBLIC
    //MARK: PickerPresenter
    internal dynamic func pickerPresenter(delegate: PickerPresenterDelegate, viewController: UIViewController) -> AnyObject {
        return TyphoonDefinition.withClass(PickerPresenter.self) {
            (definition) in
                definition.injectProperty("delegate", with: delegate)
                definition.injectProperty("cameraManager", with: self.commonAssembly.cameraManager(viewController))
        }
    }
    
    //MARK: SharePresenter
    internal dynamic func sharePresenter(delegate: SharePresenterDelegate, viewController: UIViewController) -> AnyObject {
        return TyphoonDefinition.withClass(SharePresenter.self) {
            (definition) in
                definition.injectProperty("delegate", with: delegate)
                definition.injectProperty("activityManager", with: self.commonAssembly.activityManager(viewController))
        }
    }
}
