//
//  Group.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/24/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class Group: NSObject {
    var _id: String
    var name: String
    var groupDescription: String
    var password: String?
		var admins: [String]?
    
	init(_id: String, name: String, description: String, password: String?, admins: [String]?){
        self._id = _id
        self.name = name
        self.groupDescription = description
        self.password = password
				self.admins = admins
    }
	
	static func createFromJSON(json: [String: Any]?) -> Group?{
		guard let json = json else{
			return nil
		}
		let _id = json["_id"] as! String
		let name = json["name"] as! String
		let groupDescription = json["description"] as! String
		let password = json["password"] as! String
		let admins = json["admins"] as! [String]
		
		return Group(_id: _id, name: name, description: groupDescription, password: password, admins: admins)
	}
	
    // TODO: Implement create from Json method
	static func createFromJSONArray(jsonArray: NSArray) -> [Group]?{
		var groups = [Group]()
		for json in jsonArray{
			groups.append(createFromJSON(json: json as? [String: Any])!)
		}
		return groups
	}
}
