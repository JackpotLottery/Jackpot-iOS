//
//  ApprovedViewControllerExtensions.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/25/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

extension AcceptedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
			if(indexPath.row >= events.count){
				return UICollectionViewCell()
			}
			
			let item = events[indexPath.row]
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AcceptedEventCollectionViewCell", for: indexPath) as? AcceptedEventCollectionViewCell{
            
            cell.item = item
					
					let group = groups.first(where: { (g) -> Bool in
						g._id == item.groupID
					})
					if let group = group{
						cell.groupLabel?.text = "Hosted by " + group.name
					}
					return cell
        }
        
        return UICollectionViewCell()
    }
    
}
