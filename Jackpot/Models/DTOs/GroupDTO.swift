//
//  GroupDTO.swift
//  Jackpot
//
//  Created by Nicholas Miller on 7/26/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

// TODO: Should have common class to GroupsDTO
class GroupDTO: NSObject {
	var success: Bool?
	var message: String?
	var group: Group?
	
	init(success: Bool?, message: String?, group: Group?) {
		self.success = success
		self.message = message
		self.group = group
	}
	
	static func createFromJSON(data: Data?) -> GroupDTO? {
		var groupDTO: GroupDTO? = nil
		do {
			guard let data = data,
				let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else{
					return nil
			}
			let success = json["success"] as? Bool
			let message = json["message"] as? String
			let group = Group.createFromJSON(json: (json["group"] as? [String: Any]));
			groupDTO = GroupDTO(success: success, message: message, group: group)
			
		} catch {
			print("Error deserializing JSON: \(error)")
		}
		
		return groupDTO
	}
}
