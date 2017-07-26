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
        let item = events[indexPath.row]
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AcceptedEventCollectionViewCell", for: indexPath) as? AcceptedEventCollectionViewCell{
            
            cell.item = item
            return cell
        }
        
        return UICollectionViewCell()
    }
    
}
