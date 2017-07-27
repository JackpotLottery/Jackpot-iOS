//
//  JPHttpClient.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/22/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit
import Alamofire

class JPHttpClient: NSObject {
    private let BASE_URL = "https://3c927f85.ngrok.io"
    
    func postLogin(email: String, password: String, completion: @escaping (AuthenticationDTO?) -> Void) -> Void {
        Alamofire.request(
            URL(string: BASE_URL + "/auth/login")!,
            method: .post,
            parameters: ["email": email, "password": password])
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    if let errorMessage = response.result.error{
                        print("Error loging in: \(errorMessage)")
                    } else{
                        print("Error loging in: (Unknown Error)")
                    }
                    completion(nil)
                    return
                }
                
                let result = AuthenticationDTO.createFromJSON(data: response.data)
                completion(result)
        }
    }
    
    func postSignup(name: String, email: String, password: String, completion: @escaping (AuthenticationDTO?) -> Void) -> Void {
        Alamofire.request(
            URL(string: BASE_URL + "/auth/signup")!,
            method: .post,
            parameters: ["displayName": name, "email": email, "password": password])
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    if let errorMessage = response.result.error{
                        print("Error loging in: \(errorMessage)")
                    } else{
                        print("Error loging in: (Unknown Error)")
                    }
                    completion(nil)
                    return
                }
                
                let result = AuthenticationDTO.createFromJSON(data: response.data)
                completion(result)
        }
    }
	
	// TODO: Need to respond to tokens expired and launch login screen
	func getGroups(user: User, completion: @escaping (GroupsDTO?) -> Void) -> Void {
		Alamofire.request(
			URL(string: BASE_URL + "/groups")!,
			method: .get,
			parameters: ["userID": user._id, "token": user.token])
			.validate()
			.responseJSON { (response) -> Void in
				guard response.result.isSuccess else {
					print(response.response?.statusCode)
					if let errorMessage = response.result.error{
						print("Error loging in: \(errorMessage)")
					} else{
						print("Error loging in: (Unknown Error)")
					}
					completion(nil)
					return
				}
				
				let result = GroupsDTO.createFromJSON(data: response.data)
				completion(result)
		}
	}
	
	func getMyGroups(user: User, completion: @escaping (GroupsDTO?) -> Void) -> Void {
		Alamofire.request(
			URL(string: BASE_URL + "/groups/myGroups")!,
			method: .get,
			parameters: ["userID": user._id, "token": user.token])
			.validate()
			.responseJSON { (response) -> Void in
				guard response.result.isSuccess else {
					print(response.response?.statusCode)
					if let errorMessage = response.result.error{
						print("Error loging in: \(errorMessage)")
					} else{
						print("Error loging in: (Unknown Error)")
					}
					completion(nil)
					return
				}
				
				let result = GroupsDTO.createFromJSON(data: response.data)
				completion(result)
		}
	}
	
	func postCreateGroup(user: User, name: String, password: String, description: String, completion: @escaping (GroupDTO?) -> Void) -> Void {
		Alamofire.request(
			URL(string: BASE_URL + "/groups/create")!,
			method: .post,
			parameters: ["userID": user._id, "token": user.token, "password": password, "description": description, "name": name])
			.validate()
			.responseJSON { (response) -> Void in
				guard response.result.isSuccess else {
					if let errorMessage = response.result.error{
						print("Error loging in: \(errorMessage)")
					} else{
						print("Error loging in: (Unknown Error)")
					}
					completion(nil)
					return
				}
				
				let result = GroupDTO.createFromJSON(data: response.data)
				completion(result)
		}
	}
	
	func postJoinGroup(user: User, name: String, password: String, completion: @escaping (GroupDTO?) -> Void) -> Void {
		Alamofire.request(
			URL(string: BASE_URL + "/groups/join")!,
			method: .post,
			parameters: ["userID": user._id, "token": user.token, "password": password, "name": name])
			.validate()
			.responseJSON { (response) -> Void in
				guard response.result.isSuccess else {
					if let errorMessage = response.result.error{
						print("Error loging in: \(errorMessage)")
					} else{
						print("Error loging in: (Unknown Error)")
					}
					completion(nil)
					return
				}
				
				let result = GroupDTO.createFromJSON(data: response.data)
				completion(result)
		}
	}
	
	func getExploreEvents(user: User, groups: String, completion: @escaping (EventsDTO?) -> Void) -> Void {
		Alamofire.request(
			URL(string: BASE_URL + "/events/explore")!,
			method: .get,
			parameters: ["userID": user._id, "token": user.token, "groups": groups])
			.validate()
			.responseJSON { (response) -> Void in
				guard response.result.isSuccess else {
					if let errorMessage = response.result.error{
						print("Error loging in: \(errorMessage)")
					} else{
						print("Error loging in: (Unknown Error)")
					}
					completion(nil)
					return
				}
				
				let result = EventsDTO.createFromJSON(data: response.data)
				completion(result)
		}
	}
	func getPendingEvents(user: User, groups: String, completion: @escaping (EventsDTO?) -> Void) -> Void {
		Alamofire.request(
			URL(string: BASE_URL + "/events/pending")!,
			method: .get,
			parameters: ["userID": user._id, "token": user.token, "groups": groups])
			.validate()
			.responseJSON { (response) -> Void in
				guard response.result.isSuccess else {
					if let errorMessage = response.result.error{
						print("Error loging in: \(errorMessage)")
					} else{
						print("Error loging in: (Unknown Error)")
					}
					completion(nil)
					return
				}
				
				let result = EventsDTO.createFromJSON(data: response.data)
				completion(result)
		}
	}
	func getAcceptedEvents(user: User, groups: String, completion: @escaping (EventsDTO?) -> Void) -> Void {
		Alamofire.request(
			URL(string: BASE_URL + "/events/accepted")!,
			method: .get,
			parameters: ["userID": user._id, "token": user.token, "groups": groups])
			.validate()
			.responseJSON { (response) -> Void in
				guard response.result.isSuccess else {
					if let errorMessage = response.result.error{
						print("Error loging in: \(errorMessage)")
					} else{
						print("Error loging in: (Unknown Error)")
					}
					completion(nil)
					return
				}
				
				let result = EventsDTO.createFromJSON(data: response.data)
				completion(result)
		}
	}
	
	func postJoinEvent(user: User, eventID: String, completion: @escaping (EventDTO?) -> Void) -> Void {
		Alamofire.request(
			URL(string: BASE_URL + "/events/join")!,
			method: .post,
			parameters: ["userID": user._id, "token": user.token, "eventID": eventID])
			.validate()
			.responseJSON { (response) -> Void in
				guard response.result.isSuccess else {
					if let errorMessage = response.result.error{
						print("Error loging in: \(errorMessage)")
					} else{
						print("Error loging in: (Unknown Error)")
					}
					completion(nil)
					return
				}
				
				let result = EventDTO.createFromJSON(data: response.data)
				completion(result)
		}
	}
	
	func postCloseEvent(user: User, eventID: String, completion: @escaping (EventDTO?) -> Void) -> Void {
		Alamofire.request(
			URL(string: BASE_URL + "/events/close")!,
			method: .post,
			parameters: ["token": user.token, "eventID": eventID])
			.validate()
			.responseJSON { (response) -> Void in
				guard response.result.isSuccess else {
					if let errorMessage = response.result.error{
						print("Error loging in: \(errorMessage)")
					} else{
						print("Error loging in: (Unknown Error)")
					}
					completion(nil)
					return
				}
				
				let result = EventDTO.createFromJSON(data: response.data)
				completion(result)
		}
	}
	
	func postCreateEvent(user: User,
	                     name: String,
	                     location: String,
	                     description: String,
	                     group: String,
	                     tag: String,
	                     date: Date,
	                     deadline: Date,
	                     capacity: String,
	                     completion: @escaping (EventDTO?) -> Void) -> Void {
		Alamofire.request(
			URL(string: BASE_URL + "/events/create")!,
			method: .post,
			parameters: ["userID": user._id,
			             "token": user.token,
			             "name": name,
			             "location": location,
			             "description": description,
			             "group": group,
			             "tag": tag,
			             "date": date.timeIntervalSince1970, // TODO: Verify date stuff
			             "deadline": deadline.timeIntervalSince1970,
			             "capacity": capacity])
			.validate()
			.responseJSON { (response) -> Void in
				guard response.result.isSuccess else {
					if let errorMessage = response.result.error{
						print("Error loging in: \(errorMessage)")
					} else{
						print("Error loging in: (Unknown Error)")
					}
					completion(nil)
					return
				}
				
				let result = EventDTO.createFromJSON(data: response.data)
				completion(result)
		}
	}
}
