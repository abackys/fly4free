//
//  FeedHandler.swift
//  Fly4Free
//
//  Created by MacBook on 7/11/15.
//  Copyright (c) 2015 opendev. All rights reserved.
//

import UIKit
import Alamofire

class FeedHandler: NSObject {
   
}

extension Request {
    
    func responseItems(completionHandler: (NSArray,  NSError?) -> Void) -> Self {
        return responseJSON { (_, _, JSON, error) in
            
            var items : [Item] = []
       
            let jsonArray = JSON as! NSArray
         
            for itemDict in jsonArray {
                let obj = itemDict as! NSDictionary
      
                let date : NSDate = NSDate()
                let imgUrl = itemDict["imgUrl"] as! String
                let item : Item = Item(title: itemDict["title"] as! String ,date: date, imgUrl: imgUrl)
                items.append(item)
            }
            
            completionHandler(items, error)
        }
    }
    
    
    class func imageResponseSerializer() -> Serializer {
        return { request, response, data in
            if data == nil {
                return (nil, nil)
            }
            
            let image = UIImage(data: data!, scale: UIScreen.mainScreen().scale)
            
            return (image, nil)
        }
    }
    
    func responseImage(completionHandler: (NSURLRequest, NSHTTPURLResponse?, UIImage?, NSError?) -> Void) -> Self {
        return response(serializer: Request.imageResponseSerializer(), completionHandler: { (request, response, image, error) in
            completionHandler(request, response, image as? UIImage, error)
        })
    }
}