//
//  ControllerAssembly.swift
//  MemeMe
//
//  Created by Jesus Antonio Gil on 11/2/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit
import Typhoon


class ControllerAssembly: TyphoonAssembly {
    
    //Inject
    var presenterAssembly: PresenterAssembly!
    
    
    //MARK: PUBLIC
    //MARK: EditViewController
    
    internal dynamic func editViewController() -> AnyObject {
        return TyphoonDefinition.withClass(EditViewController.self) {
            (definition) in
                definition.injectProperty("presenterAssembly", with: self.presenterAssembly)
        }
    }
    
}
