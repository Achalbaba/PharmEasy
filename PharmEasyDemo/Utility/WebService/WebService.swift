//
//  WebService.swift
//  PharmEasyDemo
//
//  Created by Achal Gandhi on 12/25/18.
//  Copyright © 2018 Achal Gandhi. All rights reserved.
//

import UIKit

class WebService: NSObject {
    
    private func dataTask(request: NSMutableURLRequest,method: String,completion:@escaping (_ success: Bool,_ object: [String:Any]?, _ error : Error?)->()) {
        request.httpMethod      =   method
        let session = URLSession(configuration: .default)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error == nil) {
                do {
                    if let responseData : [String:Any] = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]{
                        completion(true,responseData,error)
                    } else {
                        completion(false,nil,error)
                    }
                } catch {
                    completion(false,nil,error)
                }
            } else {
                completion(false,nil,error)
            }
        }).resume()
    }
    
    func getByUrl(path: String,params: [String : Any]!,completion:@escaping (_ success: Bool,_ object: [String:Any]?, _ error : Error?)->()) {
        let url = URL(string: path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        let request = NSMutableURLRequest(url: url)
        dataTask(request: request, method: MethodType.GET, completion: completion)
    }
    
}
