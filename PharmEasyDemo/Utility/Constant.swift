//
//  Constant.swift
//  PharmEasyDemo
//
//  Created by Achal Gandhi on 12/25/18.
//  Copyright © 2018 Achal Gandhi. All rights reserved.
//

import Foundation
import UIKit

struct TableViewCellIdentifier {
    static let userListCell      = "UserListCell"
}

struct SegueIdentifier {
    static let homeVCToDetailVC      = "HomeVCToDetailVC"
}

func getvalue(_ someobject : AnyObject) -> String{
    if !isNull(someObject: someobject){
        if let str = someobject as? String{
            return str
        } else{
            return String(describing : someobject)
        }
    }else{
        return ""
    }
}

func getInt(_ someobject : AnyObject) -> Int{
    if !isNull(someObject:someobject){
        if let str = someobject as? Int{
            return str
        }else if let str = someobject as? Float{
            return Int(str)
        }else if let str = someobject as? Double{
            return Int(str)
        }else if let str = someobject as? String{
            return Int(str) ?? 0
        }else{
            return 0
        }
    }else{
        return 0
    }
}

func isNull(someObject : Any?) -> Bool {
    guard let someObject = someObject else {
        return true
    }
    return (someObject is NSNull)
}
