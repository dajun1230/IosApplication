//
//  AppDelegate.swift
//  IosApplication
//
//  Created by 小杨 on 2023/10/28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 设置默认显示界面
        let controller = ViewController();
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = controller;
        window!.makeKeyAndVisible();
        
        return true
    }
    
}

