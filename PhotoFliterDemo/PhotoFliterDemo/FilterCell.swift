//
//  FilterCell.swift
//  PhotoFliterDemo
//
//  Created by Qi on 2020/9/25.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {
    var dataSource: (String, UIImage) = ("", UIImage()) {
        didSet {
            icon.image = dataSource.1
            title.text = dataSource.0
        }
    }

    lazy var icon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()

    lazy var title: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 10)
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.transform = CGAffineTransform(rotationAngle: .pi / 2)
        contentView.backgroundColor = .white
        selectionStyle = .none
        setUI()
    }

    func setUI() {
        icon.frame = CGRect(x: 10, y: 10, width: 60, height: 80)
        title.frame = CGRect(x: 5, y: 90, width: 70, height: 40)
        contentView.addSubview(icon)
        contentView.addSubview(title)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
