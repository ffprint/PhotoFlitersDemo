//
//  FlitersTool.swift
//  PhotoFliterDemo
//
//  Created by Qi on 2020/9/24.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class FlitersTool: NSObject {
    
    static let shared = FlitersTool()
    private let context = CIContext(options: nil)
    private var categorysDic: NSDictionary = [:]

    override init() {
        guard let path = Bundle.main.path(forResource: "FilterCategory", ofType: "plist") else { return }
        categorysDic = NSDictionary(contentsOfFile: path)!
    }

    func getFiltesByCategory(_ category: String) -> [String] {
        let categoryDic = categorysDic[category] as! [String: [String]]
        let filters = categoryDic[category]
        return filters!
    }

    func FiltersCategorys() -> [String] {
        categorysDic.allKeys as! [String]
    }
    
    func filter(_ filterName: String) -> CIFilter {
        let filter = CIFilter(name: filterName)
        return filter!
    }
    
    /*
     //        let image1 = CIImage.init(cgImage: (image?.cgImage)!)
     //
     //        filter?.setValue(image1, forKey: kCIInputImageKey)
     //        filter?.setValue(NSNumber.init(value: 10), forKey: kCIInputRadiusKey)
     //
     //        let out = filter?.outputImage
     //        let cgimage = context.createCGImage(out!, from: out!.extent)
     //        let filter_image = UIImage.init(cgImage: cgimage!)
     //        imageView1.image = filter_image
     */
    
    func filterImage(_ image: UIImage, _ filterName: String) -> UIImage {
        let originalCIImage = CIImage.init(cgImage: image.cgImage!)
        let filter = self.filter(filterName)
        
        filter.setValue(originalCIImage, forKey: kCIInputImageKey)
        
        let outImage = filter.outputImage
        let filterCgImage = context.createCGImage(outImage!, from: outImage!.extent)
        let filterImage = UIImage.init(cgImage: filterCgImage!)
        return filterImage
    }
    
}
