//
//  ExploreViewControllerExtensions.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/24/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

extension ExploreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
			if(indexPath.row >= events.count){
				return UICollectionViewCell()
			}			
			let item = events[indexPath.row]
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreEventCollectionViewCell", for: indexPath) as? ExploreEventCollectionViewCell{
						cell.onComplete = removeEventFromCollection
            cell.item = item
						let group = groups.first(where: { (g) -> Bool in
							g._id == item.groupID
						})
						if let group = group{
							cell.groupLabel?.text = "Hosted by " + group.name
							
							let admin = group.admins?.first(where: { (a) -> Bool in
								a == Authentication.getUser()?._id
							})
							
							if (admin != nil){
								cell.isOwner = true
								cell.applyButton?.setTitle("Close Registration", for: .normal)
								cell.applyButton.backgroundColor = UIColor.orange
							}
						}
										
            return cell
        }
                
        return UICollectionViewCell()
    }
	
	func removeEventFromCollection(item: Event?){
		if let item = item{
			let index = events.index(of: item)
			if let index = index{
				events.remove(at: index)
				collectionView.reloadData()
			}
		}
	}
    
}

