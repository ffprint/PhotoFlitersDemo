//
//  FlitersViewController.swift
//  PhotoFliterDemo
//
//  Created by Qi on 2020/9/23.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class FlitersViewController: BaseTableViewController, ImagePickerProtocol {
//    private var _dataSource = ["CICategoryBlur",
//                               "CICategoryColorAdjustment",
//                               "CICategoryColorEffect",
//                               "CICategoryCompositeOperation"]
//
//    override var dataSource: [String] {
//        get { _dataSource }
//        set { _dataSource = newValue }
//    }

    var category: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = getFiltersByCategory(category)
    }

    func getFiltersByCategory(_ category: String) -> [String] {
        let filters = CIFilter.filterNames(inCategory: category)
        return filters
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)

        let pick = ImagePickerViewController()
        pick.delegate = self
        present(pick, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        print(info)
//        picker.dismiss(animated: true) {
//
//        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
