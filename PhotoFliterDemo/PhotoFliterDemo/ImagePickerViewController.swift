//
//  ImagePickerViewController.swift
//  PhotoFliterDemo
//
//  Created by Qi on 2020/9/23.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import Photos

typealias ImagePickerProtocol = (UIImagePickerControllerDelegate & UINavigationControllerDelegate)

class ImagePickerViewController: UIImagePickerController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allowsEditing = false
        if let mediaTypes = UIImagePickerController.availableMediaTypes(for: UIImagePickerController.SourceType.photoLibrary) {
            self.mediaTypes = mediaTypes
            sourceType = .photoLibrary

        } else {
            assertionFailure("读取相册失败!!")
        }
        
    }

}
extension ImagePickerViewController {
    func delegate(_ delegate: ImagePickerProtocol) -> Self {
        self.delegate = delegate
        return self
    }
}
