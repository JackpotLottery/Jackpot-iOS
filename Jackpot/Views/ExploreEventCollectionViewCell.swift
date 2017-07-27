//
//  ExploreEventCollectionViewCell.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/24/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class ExploreEventCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
		@IBOutlet weak var applyButton: UIButton!
		var isOwner = false
		var httpClient = JPHttpClient()
	var onComplete: ((_ event: Event?) -> Void)?
	
    
    @IBAction func applyButtonClicked(_ sender: Any) {
			if (isOwner){
				// Make request to close registration
				guard let user = Authentication.getUser(), let eventID = item?._id else{
					return
				}
				
				httpClient.postCloseEvent(user: user,eventID: eventID, completion: { (result: EventDTO?) in
					guard let result = result, let success = result.success, success, let _ = result.event else{
						return
					}
					
					// Join suceeded. Need to remove
					self.onComplete?(self.item)
				})
			} else{
				// Make requst to join event
				guard let user = Authentication.getUser(), let eventID = item?._id else{
					return
				}
				
				httpClient.postJoinEvent(user: user,eventID: eventID, completion: { (result: EventDTO?) in
					guard let result = result, let success = result.success, success, let _ = result.event else{
						return
					}
					
					// Join suceeded. Need to remove
					self.onComplete?(self.item)
				})
			}
    }
    
    var item: Event? {
        didSet {
            guard let item = item else {
                return
            }
            // Set the image
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView?.image = UIImage(named: "jackpot!")
            
            // Set the name
            nameLabel?.text = item.name
            
            // Set the date info
            if let date = item.date as Date?{
                let formatter = DateFormatter()
                formatter.dateStyle = .long
                formatter.timeStyle = .medium
                
                let dateString = formatter.string(from: date)
                dateLabel?.text = dateString
                
                if (dateString.count > 2){
                    let index = dateString.index(dateString.startIndex, offsetBy: 3)
                    let month = dateString.substring(to: index)
                    monthLabel?.text = month
                }
                
                let dateSplit = dateString.components(separatedBy: " ")
                if (dateSplit.count > 1){
                    var day = dateSplit[1]
                    dayLabel?.text = day.substring(to: day.index(before: day.endIndex))
                }
            }
            
            // Set the group label
            groupLabel?.text = item.groupName
            
            // Set the address
            addressLabel?.text = item.location
            
            // Set the description
            descriptionLabel?.text = item.eventDescription
					
						// Set the button label
						applyButton?.setTitle("Apply", for: .normal)
					
						applyButton?.backgroundColor = UIColor(red: 0, green: 0.48, blue: 1.0, alpha: 0.77)
						isOwner = false
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Add shadow
        self.layer.masksToBounds = false;
        self.layer.shadowOffset = CGSize(width: 0, height: 2);
        self.layer.shadowRadius = 4;
        self.layer.shadowOpacity = 0.3;
    }
}
