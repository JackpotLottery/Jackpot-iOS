//
//  ExploreEventCollectionViewCell.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/24/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class ExploreEventCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var testLabel: UILabel!
    
    var item: Event? {
        didSet {
            guard let item = item else {
                return
            }
            testLabel?.text = item.name
        }
    }
}
