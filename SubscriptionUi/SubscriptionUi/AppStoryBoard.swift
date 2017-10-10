//
//  AppStoryBoard.swift
//  SubscriptionUi
//
//  Created by Appinventiv Technologies on 10/10/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import Foundation
import UIKit

enum AppStoryboard : String {
    
    case Main
    case Prelogin
    case Home
    case Dashboard
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        //        let id = storyboardID.replacingOccurrences(of: "VC", with: "VC")
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

