//
//  AppDelegate.swift
//  PhotoFliterDemo
//
//  Created by Qi on 2020/9/22.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

let isIphoneX: Bool = {
    if #available(iOS 11.0, *) {
        if UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0 > 0 {
            return true
        }
    }
    return false
}()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let rootNav = UINavigationController(rootViewController: MainViewController())
        window?.rootViewController = rootNav
        window?.makeKeyAndVisible()

        return true
    }

}
