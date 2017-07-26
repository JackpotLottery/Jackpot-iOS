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
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        flowLayout.itemSize.width = view.bounds.width - 20
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Load the data
        fetchData()
        collectionView.reloadData()
    }
    
    private func fetchData(){
        // TODO: Make a network request
        events = [Event(_id: "0",
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
