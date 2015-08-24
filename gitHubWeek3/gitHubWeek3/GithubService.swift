//
//  GithubService.swift
//  
//
//  Created by Benjamin Laddin on 8/17/15.
//
//

import Foundation

class GithubService{
  class func repositoriesForSearchTerm(searchTerm : String) {
    let baseURL = "http://localhost:3000"
    let finalURL = baseURL + "?q=\(searchTerm)"
    if let url = NSURL(string: finalURL){
      NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, responce, error) -> Void in
        if let error = error{
          println("error")
        }else if let httpResponse = responce as? NSHTTPURLResponse{
         println(httpResponse)
        }
      }).resume()
      //resume is important dont forget it
    }
  }
  
  class func userForSearchTerm(searchTerm: String, userSearchCallback: (errorDescription: String?, users :[User]?) -> (Void)){
    let baseURL = "https//:api.github.com/search/users"
    let finalURL = baseURL + "?q=\(searchTerm)"
    let request = NSMutableURLRequest(URL: NSURL(string: finalURL)!)
    if let token = KeychainService.loadToken(){
      request.setValue("token\(token)", forHTTPHeaderField: "Authorization")
      
    }
    
    if let url = NSURL(string: finalURL){
      NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data, responce, error) -> Void in
        if let error = error{
          println("error github service ln 39")
        }else if let httpResponse = responce as? NSHTTPURLResponse{
          println(httpResponse)
        
          if httpResponse.statusCode == 200{
            if let users = UserJsonParser.usersFromJsonParser(data){
              NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                userSearchCallback(errorDescription: nil, users: nil)
              })
            }
          }
          userSearchCallback(errorDescription: nil, users: nil)
        }
      }).resume()
    }
    
  }
}
