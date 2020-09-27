//
//  ImagePickerViewController.swift
//  PhotoFliterDemo
//
//  Created by Qi on 2020/9/23.
//  Copyright © 2020 admin. All rights reserved.
//

import Photos
import UIKit

typealias ImagePickerProtocol = (UIImagePickerControllerDelegate & UINavigationControllerDelegate)

class ImagePickerViewController: UIImagePickerController {
    override func viewDidLoad() {
        super.viewDidLoad()
        allowsEditing = false
        sourceType = .photoLibrary
    }
}

extension ImagePickerViewController {
    func delegate(_ delegate: ImagePickerProtocol) -> Self {
        self.delegate = delegate
        return self
    }
}
