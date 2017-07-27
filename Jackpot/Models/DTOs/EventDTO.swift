//
//  EventDTO.swift
//  Jackpot
//
//  Created by Nicholas Miller on 7/26/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class EventDTO: NSObject {
	var success: Bool?
	var message: String?
	var event: Event?
	
	init(success: Bool?, message: String?, event: Event?) {
		self.success = success
		self.message = message
		self.event = event
	}
	
	static func createFromJSON(data: Data?) -> EventDTO? {
		var eventDTO: EventDTO? = nil
		do {
			guard let data = data,
				let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else{
					return nil
			}
			let success = json["success"] as? Bool
			let message = json["message"] as? String
			let event = Event.createFromJSON(json: json["event"] as? [String: Any]);
			eventDTO = EventDTO(success: success, message: message, event: event)
		} catch {
			print("Error deserializing JSON: \(error)")
		}
		
		return eventDTO
	}
}
