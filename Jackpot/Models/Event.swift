//
//  Event.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/24/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class Event: NSObject {
    // TODO: This may not be all the properties
    var _id: String?
    var name: String?
    var eventDescription: String?
    var groupName: String?
		var groupID: String?
    var location: String?
    var date: Date?
    var expirationDate: Date?
    var capacity: Int?
    var requestedUsers: [String]?
    var acceptedUsers: [String]?
    var tag: String?
    
    init(_id: String?,
         name: String?,
         eventDescription: String?,
         groupName: String?,
         groupID: String?,
         location: String?,
         date: Date?,
         expirationDate: Date?,
         capacity: Int?,
         requestedUsers: [String]?,
         acceptedUsers: [String]?,
         tag: String?){
        self._id = _id
        self.name = name
        self.eventDescription = eventDescription
			self.groupName = groupName // TODO: remove this and just add it to the view later
				self.groupID = groupID
        self.location = location
        self.date = date
        self.expirationDate = expirationDate
        self.capacity = capacity
			self.requestedUsers = requestedUsers // TOOD: I don't think we need the users
        self.acceptedUsers = acceptedUsers
        self.tag = tag
    }
	
	static func createFromJSON(json: [String: Any]?) -> Event?{
		guard let json = json else{
			return nil
		}
		let _id = json["_id"] as! String
		let name = json["name"] as! String
		let eventDescription = json["description"] as! String
		let groupName = "" // TODO: Eventually get this from the server
		let groupID = json["group"] as! String
		let location = json["location"] as! String
		let capacity = json["capacity"] as! Int
		let requestedUsers = [String]()
		let acceptedUsers = [String]()
		let tag = json["tag"] as! String
		
		// Convert dates
		let dateString = json["date"] as! String
		let expirationDateString = json["deadline"] as! String
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
		dateFormatter.locale = Locale(identifier: "en_US")
		let date = dateFormatter.date(from:dateString)
		let expirationDate = dateFormatter.date(from:expirationDateString)
		
		return Event(_id: _id, name: name, eventDescription: eventDescription, groupName: groupName, groupID: groupID, location: location, date: date, expirationDate: expirationDate, capacity: capacity, requestedUsers: requestedUsers, acceptedUsers: acceptedUsers, tag: tag)
	}
	
	static func createFromJSONArray(jsonArray: NSArray) -> [Event]?{
		var events = [Event]()
		for json in jsonArray{
			events.append(createFromJSON(json: json as? [String: Any])!)
		}
		return events
	}
}
