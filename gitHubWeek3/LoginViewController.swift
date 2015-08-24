//
//  LoginViewController.swift
//  gitHubWeek3
//
//  Created by Benjamin Laddin on 8/19/15.
//  Copyright (c) 2015 Benjamin Laddin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "newToken", name: kTokenNotif, object: nil)
  }


  override func viewDidAppear(animated: Bool) {
    
    if let token = KeychainService.loadToken(){

    }else{
      AuthService.performInitialRequest()
    }
  }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  
  
  func newToken(){
    performSegueWithIdentifier("MoveToMenu", sender: nil)
  }

  deinit{
    NSNotificationCenter.defaultCenter().removeObserver(self, name: kTokenNotif, object : nil)
  }

}
