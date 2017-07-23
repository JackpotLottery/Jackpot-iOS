//
//  AuthenticationDTO.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/22/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class AuthenticationDTO: NSObject {
    var success: Bool?
    var message: String?
    var user: User?
    
    init(success: Bool?, message: String?, user: User?) {
        self.success = success
        self.message = message
        self.user = user
    }
    
    static func createFromJSON(data: Data?) -> AuthenticationDTO? {
        var authenticationDTO: AuthenticationDTO? = nil
        do {
            guard let data = data,
                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else{
                    return nil
            }
            let blah = json["success"]
            let success = json["success"] as? Bool
            let message = json["message"] as? String
            let user = User.createFromJSON(json: json["user"] as? [String: Any]);
            authenticationDTO = AuthenticationDTO(success: success, message: message, user: user)
            
        } catch {
            print("Error deserializing JSON: \(error)")
        }
        
        return authenticationDTO
    }
}
