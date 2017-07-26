//
//  ExploreViewController.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/22/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    
    // MARK: Properties
    var events = [Event]()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
	
		@IBAction func addEventButtonClicked(_ sender: Any) {
			let createEventViewController = storyboard!.instantiateViewController(withIdentifier: "CreateEventViewController") as! CreateEventViewController
			
			createEventViewController.onComplete = reloadData
			present(createEventViewController, animated: true, completion: nil)
		}
	
		private func reloadData(){
			fetchData()
			collectionView.reloadData()
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
    
    private func fetchData(){
        // TODO: Make a network request
        events = [Event(_id: "0",
                         name: "A fun event!",
                         eventDescription: "Event Description. A long even description. Like a really long one that is going to gake up multiple lines that way I see what it looks like when that happesn. Whats gonna happen? Idk man.... lets find out. I'm gonna keep typing for a little but this is probably good. Alright Ill stop now.",
                         groupName: "Super fun group",
                         location: "1234 W Road St, Seattle, WA, 89716",
                         date: NSDate(),
                         expirationDate: NSDate(),
                         capacity: 50,
                         requestedUsers: [String](),
                         acceptedUsers: [String](),
                         tag: "Sounders"),
                  Event(_id: "0",
                        name: "A fun event!",
                        eventDescription: "Event Description",
                        groupName: "Super fun group",
                        location: "1234 W Road St, Seattle, WA, 89716",
                        date: NSDate(),
                        expirationDate: NSDate(),
                        capacity: 50,
                        requestedUsers: [String](),
                        acceptedUsers: [String](),
                        tag: "Sounders"),
                  Event(_id: "0",
                        name: "A fun event!",
                        eventDescription: "Event Description",
                        groupName: "Super fun group",
                        location: "1234 W Road St, Seattle, WA, 89716",
                        date: NSDate(),
                        expirationDate: NSDate(),
                        capacity: 50,
                        requestedUsers: [String](),
                        acceptedUsers: [String](),
                        tag: "Sounders"),
                  Event(_id: "0",
                        name: "A fun event!",
                        eventDescription: "Event Description",
                        groupName: "Super fun group",
                        location: "1234 W Road St, Seattle, WA, 89716",
                        date: NSDate(),
                        expirationDate: NSDate(),
                        capacity: 50,
                        requestedUsers: [String](),
                        acceptedUsers: [String](),
                        tag: "Sounders"),
                  Event(_id: "0",
                        name: "A fun event!",
                        eventDescription: "Event Description",
                        groupName: "Super fun group",
                        location: "1234 W Road St, Seattle, WA, 89716",
                        date: NSDate(),
                        expirationDate: NSDate(),
                        capacity: 50,
                        requestedUsers: [String](),
                        acceptedUsers: [String](),
                        tag: "Sounders"),
                  Event(_id: "0",
                        name: "A fun event!",
                        eventDescription: "Event Description",
                        groupName: "Super fun group",
                        location: "1234 W Road St, Seattle, WA, 89716",
                        date: NSDate(),
                        expirationDate: NSDate(),
                        capacity: 50,
                        requestedUsers: [String](),
                        acceptedUsers: [String](),
                        tag: "Sounders"),
                  Event(_id: "0",
                        name: "A fun event!",
                        eventDescription: "Event Description",
                        groupName: "Super fun group",
                        location: "1234 W Road St, Seattle, WA, 89716",
                        date: NSDate(),
                        expirationDate: NSDate(),
                        capacity: 50,
                        requestedUsers: [String](),
                        acceptedUsers: [String](),
                        tag: "Sounders"),
                  Event(_id: "0",
                        name: "A fun event!",
                        eventDescription: "Event Description",
                        groupName: "Super fun group",
                        location: "1234 W Road St, Seattle, WA, 89716",
                        date: NSDate(),
                        expirationDate: NSDate(),
                        capacity: 50,
                        requestedUsers: [String](),
                        acceptedUsers: [String](),
                        tag: "Sounders"),
                  Event(_id: "0",
                        name: "A fun event!",
                        eventDescription: "Event Description",
                        groupName: "Super fun group",
                        location: "1234 W Road St, Seattle, WA, 89716",
                        date: NSDate(),
                        expirationDate: NSDate(),
                        capacity: 50,
                        requestedUsers: [String](),
                        acceptedUsers: [String](),
                        tag: "Sounders"),
                  Event(_id: "0",
                        name: "A fun event!",
                        eventDescription: "Event Description",
                        groupName: "Super fun group",
                        location: "1234 W Road St, Seattle, WA, 89716",
                        date: NSDate(),
                        expirationDate: NSDate(),
                        capacity: 50,
                        requestedUsers: [String](),
                        acceptedUsers: [String](),
                        tag: "Sounders"),
                  Event(_id: "0",
                        name: "A fun event!",
                        eventDescription: "Event Description",
                        groupName: "Super fun group",
                        location: "1234 W Road St, Seattle, WA, 89716",
                        date: NSDate(),
                        expirationDate: NSDate(),
                        capacity: 50,
                        requestedUsers: [String](),
                        acceptedUsers: [String](),
                        tag: "Sounders"),
                  Event(_id: "0",
                        name: "A fun event!",
                        eventDescription: "Event Description",
                        groupName: "Super fun group",
                        location: "1234 W Road St, Seattle, WA, 89716",
                        date: NSDate(),
                        expirationDate: NSDate(),
                        capacity: 50,
                        requestedUsers: [String](),
                        acceptedUsers: [String](),
                        tag: "Sounders")
                  
        ]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

