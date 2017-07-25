//
//  ProfileViewModelExtension.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/24/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

extension ProfileViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.type {
        case .userInfo:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell", for: indexPath) as? UserInfoTableViewCell {
                cell.item = item
                return cell
            }
        case .group:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as? GroupTableViewCell {
                cell.item = groups?[indexPath.row]
                return cell
            }
        }
        // return the default cell if none of above succeed
        return UITableViewCell()
    }
}

extension ProfileViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        let label = UILabel(frame: CGRect(x: 10, y: 20, width: tableView.bounds.width - 10, height: 30))
        label.font = UIFont(name: "Helvetica-Bold", size: 24)
        label.textAlignment = .left
        label.text = items[section].sectionTitle
        label.textColor = .black
        view.addSubview(label)

        return view
    }


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

