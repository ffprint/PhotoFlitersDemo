//
//  BaseTableViewController.swift
//  PhotoFliterDemo
//
//  Created by Qi on 2020/9/23.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class BaseTableViewController: UIViewController {
    var dataSource: [String] = []
    lazy var tableView: UITableView = {
        let view = UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight), style: .plain)
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
}

extension BaseTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cellId"
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        cell?.textLabel?.text = dataSource[indexPath.row]
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
}
