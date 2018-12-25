//
//  WebServiceConstant.swift
//  PharmEasyDemo
//
//  Created by Achal Gandhi on 12/25/18.
//  Copyright © 2018 Achal Gandhi. All rights reserved.
//

import Foundation

struct WebServiceConstant {
    static var BaseURL = "https://reqres.in/"
    static let kId           = "id"
    static let kFirstName    = "first_name"
    static let kLastName     = "last_name"
    static let kAvatar       = "avatar"
    static let kPage         = "page"
    static let kData         = "data"
    static let kTotal        = "total"
    static let kPerPage      = "per_page"
}

struct WebServiceURLConstant {
    static let userList = "api/users"
}

struct MethodType {
    static let GET      = "GET"
}
