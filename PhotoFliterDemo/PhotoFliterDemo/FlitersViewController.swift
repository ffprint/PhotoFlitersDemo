//
//  FlitersViewController.swift
//  PhotoFliterDemo
//
//  Created by Qi on 2020/9/23.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class FlitersViewController: BaseTableViewController {
    
    var category: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = FlitersTool.shared.getFiltesByCategory(category)
    }

    func getFiltersByCategory(_ category: String) -> [String] {
        let filters = CIFilter.filterNames(inCategory: category)
        return filters
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        let vc = FilterDetailViewController()
        vc.title = dataSource[indexPath.row]
        vc.filterName = dataSource[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
