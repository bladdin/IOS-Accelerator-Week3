//
//  UserDetailViewController.swift
//  gitHubWeek3
//
//  Created by Benjamin Laddin on 8/23/15.
//  Copyright (c) 2015 Benjamin Laddin. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  var selectedUser : User!
  override func viewDidLoad() {
    super.viewDidLoad()
    //navigationController?.delegate = nil
    imageView.image = selectedUser.image
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}
