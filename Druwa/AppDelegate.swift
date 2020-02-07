//
//  AppDelegate.swift
//  Druwa
//
//  Created by 양혜리 on 25/12/2019.
//  Copyright © 2019 leeyang. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isSignUp: Bool = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        IQKeyboardManager.shared.enable = true
//        KOSession.shared()?.logoutAndClose { [weak self] (success, error) -> Void in
        //                  _ = self?.navigationController?.popViewController(animated: true)
//        }
//        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.kakaoSessionDidChangeWithNotification), name: NSNotification.Name.KOSessionDidChange, object: nil)
//        KOSession.shared()?.logoutAndClose { [weak self] (success, error) -> Void in
////                  _ = self?.navigationController?.popViewController(animated: true)
//        }
        return true
    }
    
    fileprivate func reloadRootViewController() {
        guard let isOpened = KOSession.shared()?.isOpen() else {
           return
        }
        
        if isOpened {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if isSignUp {
                if let resultController: SignUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController {
                    self.window?.rootViewController = resultController
                }
            } else {
                if let resultController: MainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
                    self.window?.rootViewController = resultController
                }
            }
        }
        self.window?.makeKeyAndVisible()
    }
    
    @objc func kakaoSessionDidChangeWithNotification() {
        reloadRootViewController()
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
         if KOSession.handleOpen(url) {
             return true
         }
         return false
     }
     
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
         if KOSession.handleOpen(url) {
             return true
         }
         return false
     }

     func applicationDidEnterBackground(_ application: UIApplication) {
         KOSession.handleDidEnterBackground()
     }

     func applicationDidBecomeActive(_ application: UIApplication) {
         KOSession.handleDidBecomeActive()
     }
     
}

