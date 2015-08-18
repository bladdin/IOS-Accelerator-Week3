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
}
