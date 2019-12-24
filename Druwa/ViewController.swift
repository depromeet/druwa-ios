//
//  ViewController.swift
//  Druwa
//
//  Created by 양혜리 on 25/12/2019.
//  Copyright © 2019 leeyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let session = KOSession.shared() else {
                  return
              }

              if session.isOpen() {
                  session.close()
              }
              
              session.open(completionHandler: { (error) -> Void in
                  
                  if !session.isOpen() {
                      if let error = error as NSError? {
                          switch error.code {
                          case Int(KOErrorCancelled.rawValue):
                              break
                          default:
                              print(error.description)
                          }
                      }
                  }
        })
    }


}

