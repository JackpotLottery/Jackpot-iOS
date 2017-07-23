//
//  User.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/22/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class User: NSObject, NSCoding {
    // Properties
    var _id: String
    var email: String
    var displayName: String
    var password: String
    var token: String
    var tokenExpiration: Int
    
    // Keys
    static let ID = "ID"
    static let EMAIL = "EMAIL"
    static let DISPLAYNAME = "DISPLAYNAME"
    static let PASSWORD = "PASSWORD"
    static let TOKEN = "TOKEN"
    static let TOKENEXPIRATION = "TOKENEXPIRATION"
    
    // Initializer
    init(_id: String, email: String, displayName: String, password: String, token: String, tokenExpiration: Int) {
        self._id = _id
        self.email = email
        self.displayName = displayName
        self.password = password
        self.token = token
        self.tokenExpiration = tokenExpiration
    }
    
    // Enccoding/ Decoding Stuff
    func encode(with aCoder: NSCoder) {
        aCoder.encode(_id, forKey: User.ID)
        aCoder.encode(email, forKey: User.EMAIL)
        aCoder.encode(displayName, forKey: User.DISPLAYNAME)
        aCoder.encode(password, forKey: User.PASSWORD)
        aCoder.encode(token, forKey: User.TOKEN)
        aCoder.encode(tokenExpiration, forKey: User.TOKENEXPIRATION)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let _id = aDecoder.decodeObject(forKey: User.ID) as! String
        let email = aDecoder.decodeObject(forKey: User.EMAIL) as! String
        let displayName = aDecoder.decodeObject(forKey: User.DISPLAYNAME) as! String
        let password = aDecoder.decodeObject(forKey: User.PASSWORD) as! String
        let token = aDecoder.decodeObject(forKey: User.TOKEN) as! String
        let tokenExpiration = aDecoder.decodeInteger(forKey: User.TOKENEXPIRATION)
        self.init(_id: _id, email: email, displayName: displayName, password: password, token: token, tokenExpiration: tokenExpiration)
    }
    
    static func createFromJSON(json: [String: Any]?) -> User? {
        guard let json = json else{
            return nil
        }
        let _id = json["_id"] as! String
        let email = json["email"] as! String
        let displayName = json["displayName"] as! String
        let password = json["password"] as! String
        let token = json["token"] as! String
        let tokenExpiration = json["tokenExpiration"] as! Int
        return User(_id: _id, email: email, displayName: displayName, password: password, token: token, tokenExpiration: tokenExpiration)
    }
}
