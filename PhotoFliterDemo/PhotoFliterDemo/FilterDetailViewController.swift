//
//  FilterDetailViewController.swift
//  PhotoFliterDemo
//
//  Created by Qi on 2020/9/24.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

//let isIphoneX: Bool = {
//    if #available(iOS 11.0, *) {
//        if UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0 > 0 {
//            return true
//        }
//    }
//    return false
//}()
//
//private let ImageView_Y: CGFloat = {
//    isIphoneX ? 108 : 84
//}()

class FilterDetailViewController: UIViewController {
    var originalImage: UIImage?
    var dataSource: [String] = []
    private var filterImage: UIImage?

    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()

    var filterName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        imageView.frame = CGRect(x: 20, y: ImageView_Y, width: screenWidth - 40, height: 300)
//        view.addSubview(imageView)
        
    }
}

extension FilterDetailViewController: ImagePickerProtocol {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true) {
            self.filterImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage
            self.imageView.image = FiltersTool.shared.filterImage(self.filterImage!, self.filterName)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
