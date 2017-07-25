//
//  ProfileViewModelGroupItem.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/24/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class ProfileViewModelGroupItem: ProfileViewModelItem {
    // MARK: ProfileViewModelItem protocol stuff
    var type: ProfileViewModelItemType {
        return .group
    }
    var sectionTitle: String {
        return "My Groups"
    }
    
    var rowCount: Int {
        return groups.count
    }
    
    // MARK: Other stuff
    var groups: [Group]
    
    init(groups: [Group]) {
        self.groups = groups
    }
}
