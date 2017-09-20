//
//  AppDelegate.swift
//  ShopifyApp
//
//  Created by Sebastian Kolosa on 2017-09-19.
//  Copyright © 2017 SebastianKolosa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    return true
  }
  
  func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    return .portrait
  }
}

