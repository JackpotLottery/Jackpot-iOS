//
//  AcceptedViewController.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/22/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class AcceptedViewController: UIViewController {
    var events = [Event]()
		var groups = [Group]()
		var httpClient = JPHttpClient()
	
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
	
		private func reloadData(){
			fetchData(completion: collectionView.reloadData)
		}
	
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        flowLayout.itemSize.width = view.bounds.width - 20
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Load the data
        reloadData()
    }
    
    private func fetchData(completion: @escaping (() -> Void)){
			// Clear existing dat
			events.removeAll()
			groups.removeAll()
			
			// Get the data
			guard let user = Authentication.getUser() else{
				return
			}
			
			httpClient.getGroups(user: user, completion: { (result: GroupsDTO?) in
				guard let result = result, let success = result.success, success, let _groups = result.groups else{
					return
				}
				if (!_groups.isEmpty){
					self.groups = _groups
					let groupNames = _groups.map({ (group) -> String in
						group._id
					});
					
					let groupString = groupNames.joined(separator: ",")
					
					self.httpClient.getAcceptedEvents(user: user, groups: groupString, completion: { (result: EventsDTO?) in
						guard let result = result, let success = result.success, success, let _events = result.events else{
							return
						}
						if (!_events.isEmpty){
							self.events = _events
							completion()
						}
					})
				}
			})
        
    }
}
