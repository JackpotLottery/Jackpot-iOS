//
//  JPHttpClient.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/22/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit
import Alamofire

class JPHttpClient: NSObject {
    private let BASE_URL = "https://b38ddddc.ngrok.io"
    
    func postLogin(email: String, password: String, completion: @escaping (AuthenticationDTO?) -> Void) -> Void {
        Alamofire.request(
            URL(string: BASE_URL + "/auth/login")!,
            method: .post,
            parameters: ["email": email, "password": password])
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    if let errorMessage = response.result.error{
                        print("Error loging in: \(errorMessage)")
                    } else{
                        print("Error loging in: (Unknown Error)")
                    }
                    completion(nil)
                    return
                }
                
                let result = AuthenticationDTO.createFromJSON(data: response.data)
                completion(result)
        }
    }
    
    func postSignup(name: String, email: String, password: String, completion: @escaping (AuthenticationDTO?) -> Void) -> Void {
        Alamofire.request(
            URL(string: BASE_URL + "/auth/signup")!,
            method: .post,
            parameters: ["displayName": name, "email": email, "password": password])
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    if let errorMessage = response.result.error{
                        print("Error loging in: \(errorMessage)")
                    } else{
                        print("Error loging in: (Unknown Error)")
                    }
                    completion(nil)
                    return
                }
                
                let result = AuthenticationDTO.createFromJSON(data: response.data)
                completion(result)
        }
    }
}
