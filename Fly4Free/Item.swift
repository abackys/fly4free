//
//  Item.swift
//  Fly4Free
//
//  Created by MacBook on 7/13/15.
//  Copyright (c) 2015 opendev. All rights reserved.
//

import UIKit

class Item: NSObject {
    var title : String
    var date : NSDate
    var imgUrl : String
    
    init(title : String, date : NSDate, imgUrl : String) {
        self.title = title
        self.date = date
        self.imgUrl = imgUrl
    }
   
}
