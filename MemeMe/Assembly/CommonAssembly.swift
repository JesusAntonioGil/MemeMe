//
//  CommonAssembly.swift
//  MemeMe
//
//  Created by Jesus Antonio Gil on 11/2/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit
import Typhoon


class CommonAssembly: TyphoonAssembly {

    //MARK: PUBLIC
    //MARK: LocalNotificationManager
    internal dynamic func localNotificationManager() -> AnyObject {
        return TyphoonDefinition.withClass(LocalNotificationManager.self) {
            (definition) in
                definition.injectProperty("defaultCenter", with: NSNotificationCenter.defaultCenter())
        }
    }
    
    //MARK: CameraManager
    internal dynamic func cameraManager(viewController: UIViewController) -> AnyObject {
        return TyphoonDefinition.withClass(CameraManager.self) {
            (definition) in
                definition.injectProperty("viewController", with: viewController)
        }
    }
    
    //MARK: ActivityManager
    internal dynamic func activityManager(viewController: UIViewController) -> AnyObject {
        return TyphoonDefinition.withClass(ActivityManager.self) {
            (definition) in
                definition.injectProperty("viewController", with: viewController)
                definition.injectProperty("userDefaultsManager", with: self.userDefaultsManager())
        }
    }
    
    //MARK: UserDefaultsManager
    internal dynamic func userDefaultsManager() -> AnyObject {
        return TyphoonDefinition.withClass(UserDefaultsManager.self) {
            (definition) in
                definition.injectProperty("userDefaults", with: NSUserDefaults.standardUserDefaults())
                definition.scope = .Singleton
        }
    }
}
