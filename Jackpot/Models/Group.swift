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
    // TODO: add photo URL Eventually
    
    init(_id: String, name: String, description: String){
        self._id = _id
        self.name = name
        self.groupDescription = description
    }
    
    // TODO: Implement create from Json method
}