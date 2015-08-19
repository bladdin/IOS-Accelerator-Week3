//
//  AuthService.swift
//  gitHubWeek3
//
//  Created by Benjamin Laddin on 8/18/15.
//  Copyright (c) 2015 Benjamin Laddin. All rights reserved.
//

import UIKit


class AuthService{
  
  class func performInitialRequest() {
    UIApplication.sharedApplication().openURL(NSURL(string: "https://github.com/login/oauth/authorize?client_id=\(kClientID)&redirect_uri=gitHubWeek3://oauth&scope=user,repo")!)
  }
  
  class func exchangeCodeInURL(codeURL : NSURL){
    if let code = codeURL.query{
     let request = NSMutableURLRequest(URL: NSURL(string: "https://github.com/login/oauth/acess_token?\(code)&client_id=\(kClientID)&client_secret=\(kClientSecret)")!)
      println(request.URL)
      request.HTTPMethod = "POST"
      
      request.setValue("application/json", forHTTPHeaderField: "Accept")
      
      NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, responce, error) -> Void in
        if let httpResponce = responce as? NSHTTPURLResponse{
          println(httpResponce.statusCode)
          var jsonError : NSError?
          if let rootObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? [String : AnyObject],
            token = rootObject["access_token"] as? String{
              KeychainService.saveToken(token)
              println(token)
          }
        }
      }).resume()
    }
  }
}