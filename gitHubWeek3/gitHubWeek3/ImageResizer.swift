//
//  ImageResizer.swift
//  gitHubWeek3
//
//  Created by Benjamin Laddin on 8/23/15.
//  Copyright (c) 2015 Benjamin Laddin. All rights reserved.
//

import UIKit

class ImageResizer {
  
  class func resizeImage(image: UIImage, size: CGSize) -> UIImage {
    UIGraphicsBeginImageContext(size)
    image.drawInRect(CGRect(x: 0, y: 0, width: size.width, height: size.height))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage
  }
}