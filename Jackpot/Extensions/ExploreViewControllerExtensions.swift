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
        let item = events[indexPath.section]
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreEventCollectionViewCell", for: indexPath) as? ExploreEventCollectionViewCell{
            cell.item = item
            return cell
        }
        
        return UICollectionViewCell()
    }
}
