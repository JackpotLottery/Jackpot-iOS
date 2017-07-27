//
//  ProfileViewModel.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/24/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class ProfileViewModel: NSObject {
		var httpClient = JPHttpClient()
    var items = [ProfileViewModelItem]()
    var user: User?
    var groups: [Group]?
    
    override init() {
        super.init()
    }
    
	func fetchData(completion: @escaping (() -> Void)){
        // Clear existing dat
        items.removeAll()
        
        // Get the data
				guard let user = Authentication.getUser() else{
					return
				}
			
				let userInfo = ProfileViewModelUserInfoItem(displayName: user.displayName, email: user.email)
				items.append(userInfo)
			
				httpClient.getGroups(user: user, completion: { (result: GroupsDTO?) in
					guard let result = result, let success = result.success, success, let _groups = result.groups else{
						return
					}
					
					if (!_groups.isEmpty){
						self.items.removeAll()
						self.items.append(userInfo)
						self.groups = _groups
						let groupItems = ProfileViewModelGroupItem(groups: _groups)
						self.items.append(groupItems)
					}
					completion()
				})
    }
}
