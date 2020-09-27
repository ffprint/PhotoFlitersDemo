//
//  FlitersViewController.swift
//  PhotoFliterDemo
//
//  Created by Qi on 2020/9/23.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

private let ImageView_Y: CGFloat = {
    isIphoneX ? 108 : 84
}()

class FlitersViewController: BaseTableViewController {
    var category: String = ""
    var originalImage: UIImage?

    private var filterImage: UIImage?
    private let cellId = "FilterCell"

    lazy var imageView: UIImageView = {
        let view = UIImageView.init(frame: CGRect(x: 20, y: ImageView_Y, width: screenWidth - 40, height: 300))
        view.contentMode = .scaleAspectFit
        return view
    }()

    private var flitersImages: [UIImage] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        dataSource = ["原图"] + FiltersTool.shared.getFiltesByCategory(category)
        flitersImages = FiltersTool.shared.filterImages(originalImage!, category)


        imageView.image = originalImage
        view.addSubview(imageView)

        tableView.register(FilterCell.self, forCellReuseIdentifier: cellId)
        tableView.showsVerticalScrollIndicator = false
        tableView.frame = CGRect(x: 0, y: 0, width: 130, height: screenWidth)
        tableView.center.y = screenHeight - 120
        tableView.center.x = screenWidth / 2
        tableView.transform = CGAffineTransform(rotationAngle: -.pi / 2)
    }

    func getFiltersByCategory(_ category: String) -> [String] {
        let filters = CIFilter.filterNames(inCategory: category)
        return filters
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FilterCell
        cell.dataSource = (dataSource[indexPath.row], flitersImages[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        imageView.image = flitersImages[indexPath.row]
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
