//
//  DateExtensions.swift
//  Jackpot
//
//  Created by Nicholas Miller on 7/26/17.
//  Copyright © 2017 self. All rights reserved.
//

import Foundation

extension Date {
	
	// -> Date System Formatted Medium
	func ToDateMediumString() -> NSString? {
		
		let formatter = DateFormatter()
		formatter.dateStyle = .medium;
		formatter.timeStyle = .none;
		return formatter.string(from: self) as NSString
	}
}
