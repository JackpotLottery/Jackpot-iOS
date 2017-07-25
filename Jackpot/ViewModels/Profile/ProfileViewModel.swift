//
//  ProfileViewModel.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/24/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class ProfileViewModel: NSObject {
    var items = [ProfileViewModelItem]()
    var user: User?
    var groups: [Group]?
    
    override init() {
        super.init()
    }
    
    func fetchData(){
        // Clear existing dat
        items.removeAll()
        
        // Get the data
        user = Authentication.getUser()
        groups = getGroups()
        
        // Unwrap it
        guard let user = user, let groups = groups else{
            return
        }
        
        let userInfo = ProfileViewModelUserInfoItem(displayName: user.displayName, email: user.email)
        items.append(userInfo)
        
        if (!groups.isEmpty){
            let groupItems = ProfileViewModelGroupItem(groups: groups)
            items.append(groupItems)
        }
    }
    
    private func getGroups() -> [Group]?{
        // TODO: Call Server to get groups
        return [Group(_id: "0", name: "Group 1", description: "The best group ever made!"),
                Group(_id: "1", name: "Group 2", description: "Nah brah this is the best group ever made!"),
                Group(_id: "2", name: "Group 3", description: "Yall are tripping this group is way better than yours.")]
    }
}
