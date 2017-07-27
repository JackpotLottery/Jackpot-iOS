//
//  EventsDTO.swift
//  Jackpot
//
//  Created by Nicholas Miller on 7/26/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class EventsDTO: NSObject {
	var success: Bool?
	var message: String?
	var events: [Event]?
	
	init(success: Bool?, message: String?, events: [Event]?) {
		self.success = success
		self.message = message
		self.events = events
	}
	
	static func createFromJSON(data: Data?) -> EventsDTO? {
		var eventsDTO: EventsDTO? = nil
		do {
			guard let data = data,
				let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else{
					return nil
			}
			let success = json["success"] as? Bool
			let message = json["message"] as? String
			let events = Event.createFromJSONArray(jsonArray: (json["events"] as? NSArray)!);
			eventsDTO = EventsDTO(success: success, message: message, events: events)
		} catch {
			print("Error deserializing JSON: \(error)")
		}
		
		return eventsDTO
	}
}
