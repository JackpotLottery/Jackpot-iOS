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
    var location: String?
    var date: NSDate?
    var expirationDate: NSDate?
    var capacity: Int?
    var requestedUsers: [String]?
    var acceptedUsers: [String]?
    var tag: String?
    
    init(_id: String?,
         name: String?,
         eventDescription: String?,
         groupName: String?,
         location: String?,
         date: NSDate?,
         expirationDate: NSDate?,
         capacity: Int?,
         requestedUsers: [String]?,
         acceptedUsers: [String]?,
         tag: String?){
        self._id = _id
        self.name = name
        self.eventDescription = eventDescription
        self.groupName = groupName
        self.location = location
        self.date = date
        self.expirationDate = expirationDate
        self.capacity = capacity
        self.requestedUsers = requestedUsers
        self.acceptedUsers = acceptedUsers
        self.tag = tag
    }
}
