//
//  APIManager.swift
//  Nano Invest
//
//  Created by Usman Nisar on 1/2/17.
//  Copyright © 2017 Usman. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {

    static let BaseURL = "https://dev.smartmoney.co:8443/smserver/"
    
    private static var Manager : Alamofire.SessionManager = {
        // Create the server trust policies
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "dev.smartmoney.co": .disableEvaluation
        ]
        // Create custom manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let man = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        return man
    }()
    
    static func requestServerWithJSONData(requestCall:String, requestMehtod:String, data:Data, completionHandler: ((NSDictionary?, NSError?) -> Void)?)
    {
        
        let requestURL = BaseURL + requestCall
        
        var request = URLRequest(url: URL(string: requestURL)!)
        
        if(requestMehtod.lowercased() == "get") {
            request.httpMethod = "GET"
        }
        else {
            request.httpMethod = "POST"
        }
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        request.httpBody = data
        
        
        APIManager.Manager.request(request as URLRequestConvertible)
            .responseJSON { response in
                // do whatever you want here
                switch response.result {
                case .success:
                    
                    print("Validation Successful")
                    
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                        
                        // Post a notification
                        
                        
                        let dict = NSDictionary.init(object: JSON, forKey: "json" as NSCopying)
                        completionHandler!(dict, nil)
                    }
                    
                case .failure(let error):
                    print(error)
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                    }
                    completionHandler!(nil, error as NSError?)
                }
        }
        
    }
}
