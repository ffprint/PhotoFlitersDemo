//
//  ViewController.swift
//  PhotoFliterDemo
//
//  Created by Qi on 2020/9/22.
//  Copyright © 2020 admin. All rights reserved.
//

import CoreImage
import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

class MainViewController: BaseTableViewController {
    var category = ""
    lazy var imagePick: ImagePickerViewController = {
        let vc = ImagePickerViewController().delegate(self)
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        dataSource = FiltersTool.shared.filtersCategorys()
    }
}

extension MainViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        category = dataSource[indexPath.row]
        present(imagePick, animated: true, completion: nil)
    }
}

extension MainViewController: ImagePickerProtocol {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true) {
            let vc = FlitersViewController()
            vc.title = self.category + " 类滤镜"
            vc.category = self.category
            vc.originalImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage
            vc.dataSource = self.dataSource
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
