//
//  ProfileViewController.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/22/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var profileTableView: UITableView!
    
    // MARK: Actions
    @IBAction func logoutButtonClicked(_ sender: UIButton) {
        Authentication.logout()
        Authentication.verifyIsLoggedIn(self, complete: onSignIn)
    }
    
    private var viewModel: ProfileViewModel = ProfileViewModel()
    
    private func onSignIn(){
        viewModel.fetchData()
        profileTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register tableview cells
        profileTableView.register(UINib(nibName: "UserInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "UserInfoTableViewCell")
        profileTableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: "GroupTableViewCell")
        
        profileTableView.rowHeight = UITableViewAutomaticDimension
        profileTableView.estimatedRowHeight = 140
        
        profileTableView.dataSource = viewModel
        profileTableView.delegate = viewModel
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Load the data
        viewModel.fetchData()
        profileTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
