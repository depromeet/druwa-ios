//
//  IntroViewController.swift
//  Druwa
//
//  Created by leeyang on 25/12/2019.
//  Copyright © 2019 leeyang. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
    @IBAction func pressedSignUp(_ sender: UIButton) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        appDelegate.isSignUp = true
        startKakaoLogin()
    }
    
    @IBAction func pressedLogin(_ sender: UIButton) {
        startKakaoLogin()
    }
    
    func startKakaoLogin() {
        
        //이전 카카오톡 세션 열려있으면 닫기
        guard let session = KOSession.shared() else {
            return
        }
        if session.isOpen() {
            session.close()
        }
        session.open(completionHandler: { (error) -> Void in
            if error == nil {
                if session.isOpen() {
                    //accessToken
                    print(session.token?.accessToken)
                } else {
                    print("Login failed")
                }
            } else {
                print("Login error : \(String(describing: error))")
            }
            if !session.isOpen() {
                if let error = error as NSError? {
                    switch error.code {
                    case Int(KOErrorCancelled.rawValue):
                        break
                    default:
                        //간편 로그인 취소
                        print("error : \(error.description)")
                    }
                }
            }
        })
    }
}
