//
//  User.swift
//  PharmEasyDemo
//
//  Created by Achal Gandhi on 12/24/18.
//  Copyright © 2018 Achal Gandhi. All rights reserved.
//

import UIKit
class User: NSObject {
    var id = 0
    var firstName     = ""
    var lastName      = ""
    var avatar        = ""
    
    override init() {
        
    }
    
    public class func modelsFromDictionaryArray(array:NSArray) -> NSMutableArray{
        let models = NSMutableArray ()
        for item in array{
            models.add(User(dictData: item as! [String : AnyObject]))
        }
        return models
    }
    
    required init(dictData: [String : AnyObject]) {
        id             = getInt(dictData[WebServiceConstant.kId] as AnyObject)
        firstName     = getvalue(dictData[WebServiceConstant.kFirstName] as AnyObject)
        lastName      = getvalue(dictData[WebServiceConstant.kLastName]  as AnyObject)
        avatar         = getvalue(dictData[WebServiceConstant.kAvatar]  as AnyObject)
    }
}

