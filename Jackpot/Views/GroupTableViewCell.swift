//
//  GroupTableViewCell.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/24/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionTextLabel: UILabel!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    // TODO: Make the cell resize if the dscription is long
    
    var item: Group? {
        didSet {
            guard let item = item else {
                return
            }
            
            nameTextLabel?.text = item.name
            descriptionTextLabel?.text = item.groupDescription
        }
    }
}
