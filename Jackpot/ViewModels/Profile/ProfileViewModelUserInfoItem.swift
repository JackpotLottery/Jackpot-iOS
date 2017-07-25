//
//  ProfileViewModelUserInfoItem.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/24/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class ProfileViewModelUserInfoItem: ProfileViewModelItem {
    // MARK: ProfileViewModelItem Protocol Stuff
    var type: ProfileViewModelItemType {
        return .userInfo
    }
    
    var sectionTitle: String {
        return "My Info"
    }
    
    // MARK: Other properties
    var displayName: String
    var email: String
    
    init(displayName: String, email: String){
        self.displayName = displayName
        self.email = email
    }
}
