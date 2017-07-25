//
//  Authentication.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/22/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class Authentication: NSObject {
    // Key(s)
    static let USER = "USER"
    
    // Propertires
    static var user: User? = nil
    static var httpClient: JPHttpClient = JPHttpClient()
    
    // Public Methods
    static func verifyIsLoggedIn(_ viewController: UIViewController, complete: (() -> Void)?){
        user = getUser()
        if let user = user {
            // We have a User object... Check if the user has a valid token.
            let currentDate = NSDate().timeIntervalSince1970
            let expirationDate = TimeInterval(user.tokenExpiration)
            
            if (currentDate > expirationDate){
                // Token needs to be refreshed
                refreshToken(user: user, viewController: viewController)
            }
        } else{
            // We have no user... launch login page.
            let loginViewController = viewController.storyboard!.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            loginViewController.onComplete = complete
            viewController.present(loginViewController, animated:true, completion: complete)
        }
    }
    
    static func refreshToken(user: User!, viewController: UIViewController){
        // Post login request
        httpClient.postLogin(email: user.email, password: user.password, completion: { (result: AuthenticationDTO?) in
            if let result = result, let success = result.success, success, let user = result.user {
                setUser(user: user)
                return
            }
            
            // The request failed. Clear user info and show the login page
            logout()
            let loginViewController = viewController.storyboard!.instantiateViewController(withIdentifier: "LoginViewController") as UIViewController
            viewController.present(loginViewController, animated:true, completion: nil)
        })
    }
    
    static func getUser() -> User?{
        if (user == nil){
            user = retreiveUserFromStorage()
        }
        
        return user;
    }
    
    static func setUser(user: User){
        self.user = user
        saveUserToStorage(user: user)
    }
    
    static func logout(){
        self.user = nil
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: USER)
    }
    
    // Helper Methods
    private static func retreiveUserFromStorage() -> User? {
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.object(forKey: USER) as? Data
        guard let decodedUnwrapped = decoded else{
            return nil
        }
        let decodedUser = NSKeyedUnarchiver.unarchiveObject(with: decodedUnwrapped) as? User 
        return decodedUser
    }
    
    private static func saveUserToStorage(user: User){
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: user)
        userDefaults.set(encodedData, forKey: USER)
        userDefaults.synchronize()
    }
}
