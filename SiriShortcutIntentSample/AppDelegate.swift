//
//  AppDelegate.swift
//  SiriShortcutIntentSample
//
//  Created by tamadon on 2018/12/04.
//  Copyright © 2018 tamadon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if userActivity.activityType == String(describing: ToppingIntent.self) {
            guard let intent = userActivity.interaction?.intent as? ToppingIntent,
                let topping = intent.topping,
                let window = self.window,
                let vc = window.rootViewController as? ViewController else {
                    return false
            }

            vc.topping = topping
            return true
        }
        return false
    }

}

