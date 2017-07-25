//
//  UserInfoTableViewCell.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/24/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var displayNameLabel: UILabel!
    
    var item: ProfileViewModelItem? {
        didSet {
            // cast the ProfileViewModelItem to appropriate item type
            guard let item = item as? ProfileViewModelUserInfoItem  else {
                return
            }
            displayNameLabel?.text = item.displayName
            emailLabel?.text = item.email
        }
    }
}
