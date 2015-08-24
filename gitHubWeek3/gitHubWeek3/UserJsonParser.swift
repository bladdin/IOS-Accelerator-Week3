//
//  UserJsonParser.swift
//  gitHubWeek3
//
//  Created by Benjamin Laddin on 8/21/15.
//  Copyright (c) 2015 Benjamin Laddin. All rights reserved.
//

import Foundation

class UserJsonParser{
  class func usersFromJsonParser(jsonData : NSData) -> [User]?{
    if let rootObj = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as? [String : AnyObject],
    items = rootObj["items"] as? [[String : AnyObject]] {
        var users = [User]()
        for i in items{
          if let login = i["login"] as? String,
          id = i["id"] as? Int,
          avatarId = i["avatar_url"] as? String{
   let user = User(login: login, avatarId : avatarId, id : "\(id)", image : nil)
            users.append(user)
          }
        }
      return users
    }
    return nil
  }
}