//
//  GroupDTO.swift
//  Jackpot
//
//  Created by Nicholas Miller on 7/26/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class GroupsDTO: NSObject {
	var success: Bool?
	var message: String?
	var groups: [Group]?
	
	init(success: Bool?, message: String?, groups: [Group]?) {
		self.success = success
		self.message = message
		self.groups = groups
	}
	
	static func createFromJSON(data: Data?) -> GroupsDTO? {
		var groupsDTO: GroupsDTO? = nil
		do {
			guard let data = data,
				let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else{
					return nil
			}
			let success = json["success"] as? Bool
			let message = json["message"] as? String
			let groups = Group.createFromJSONArray(jsonArray: (json["groups"] as? NSArray)!);
			groupsDTO = GroupsDTO(success: success, message: message, groups: groups)
			
		} catch {
			print("Error deserializing JSON: \(error)")
		}
		
		return groupsDTO
	}
}
