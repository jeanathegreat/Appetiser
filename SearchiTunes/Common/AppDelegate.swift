//
//  AppDelegate.swift
//  SearchiTunes
//
//  Created by JeanaTheGreat on 01/04/2019.
//  Copyright © 2019 JeanaTheGreat. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: State restoration
    // Was gonna use UIKit's app restoration capability with NSCoding
    // Decided that this approach would be better to implement here as this is not a data heavy application and no security concerns (no password, no in-app purchases, etc.)
    // For more complex databases/objects Core Data or even other more complex persistence technologies could be used
    // Ran out of time to learn how to implement it but I will learn to implement this even after the deadline
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }

}

