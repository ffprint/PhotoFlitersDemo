//
//  FlitersTool.swift
//  PhotoFliterDemo
//
//  Created by Qi on 2020/9/24.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class FiltersTool: NSObject {
    static let shared = FiltersTool()
    private let context = CIContext(options: nil)
    private var categorysDic: NSDictionary = [:]

    override init() {
        guard let path = Bundle.main.path(forResource: "FilterCategory", ofType: "plist") else { return }
        categorysDic = NSDictionary(contentsOfFile: path)!
    }

    func getFiltesByCategory(_ categoryName: String) -> [String] {
        let categoryDic = categorysDic[categoryName] as! [String: [String]]
        let filters = categoryDic[categoryName]
        return filters!
    }

    func filtersCategorys() -> [String] {
        categorysDic.allKeys as! [String]
    }

    private func filter(_ filterName: String) -> CIFilter {
        let filter = CIFilter(name: filterName)
        return filter!
    }

    func filterImage(_ image: UIImage, _ filterName: String) -> UIImage {
        let originalCIImage = CIImage(cgImage: image.cgImage!)
        let filter = self.filter(filterName)

        filter.setValue(originalCIImage, forKey: kCIInputImageKey)

        let outImage = filter.outputImage
        let filterCgImage = context.createCGImage(outImage!, from: outImage!.extent)
        let filterImage = UIImage(cgImage: filterCgImage!)
        return filterImage
    }

    func filterImages(_ originalImage: UIImage, _ categoryName: String) -> [UIImage] {
        // 导出处理后的UIImage
        func getOutImage(_ filter: CIFilter, _ filterImageArray: inout [UIImage]) {
            let outImage = filter.outputImage
            let filterCgImage = context.createCGImage(outImage!, from: outImage!.extent)
            let filterImage = UIImage(cgImage: filterCgImage!)
            filterImageArray.append(filterImage)
        }

        // 获取一个CIImage
        func getCIImage(_ originalImage: UIImage) -> CIImage {
            let ciImage = CIImage(cgImage: originalImage.cgImage!)
            return ciImage
        }

        let categoryDic = categorysDic[categoryName] as! [String: [String]]
        let filters = categoryDic[categoryName]
        let originalCIImage = CIImage(cgImage: originalImage.cgImage!)
        var filterImageArray: [UIImage] = [originalImage]

        filters?.forEach({ filterName in
            
            let filter = self.filter(filterName)
            filter.setValue(originalCIImage, forKey: kCIInputImageKey)

            switch filterName {
            case "CIBoxBlur":
                filter.setValue(NSNumber(value: 50), forKey: kCIInputRadiusKey) // 10~
                getOutImage(filter, &filterImageArray)
            case "CIDiscBlur":
                filter.setValue(NSNumber(value: 50), forKey: kCIInputRadiusKey) // 8~
                getOutImage(filter, &filterImageArray)
            case "CIGaussianBlur":
                filter.setValue(NSNumber(value: 50), forKey: kCIInputRadiusKey) // 10~
                getOutImage(filter, &filterImageArray)
            case "CIMaskedVariableBlur":
                filter.setValue(getCIImage(UIImage(named: "whiteMask")!), forKey: "inputMask")
                filter.setValue(NSNumber(value: 50), forKey: kCIInputRadiusKey) // 10，0~100
                getOutImage(filter, &filterImageArray)
            case "CIMedianFilter":
                getOutImage(filter, &filterImageArray)
            case "CIMotionBlur":
                filter.setValue(NSNumber(value: 50), forKey: kCIInputRadiusKey) // 20~
                filter.setValue(NSNumber(value: 0), forKey: kCIInputAngleKey) // 0
                getOutImage(filter, &filterImageArray)
            case "CINoiseReduction":
                filter.setValue(NSNumber(value: 0.06), forKey: "inputNoiseLevel") // 0.02
                filter.setValue(NSNumber(value: 0.6), forKey: kCIInputSharpnessKey) // 0.4
                getOutImage(filter, &filterImageArray)
            case "CIZoomBlur":
                filter.setValue(CIVector.init(x: 150, y: 150), forKey: kCIInputCenterKey) // [150,150]
                filter.setValue(NSNumber(value: 20), forKey: kCIInputAmountKey) // 20~
                getOutImage(filter, &filterImageArray)
            default:
                filterImageArray.append(originalImage)
            }

        })
        return filterImageArray

//        for filterName in filters! {
//            let filter = self.filter(filterName)
//
//            filter.setValue(originalCIImage, forKey: kCIInputImageKey)
//
//            switch filterName {
//            case "CIBoxBlur":
//                filter.setValue(NSNumber(value: 50), forKey: kCIInputRadiusKey) // 10~
//                getOutImage(filter, &filterImageArray)
//            case "CIDiscBlur":
//                filter.setValue(NSNumber(value: 50), forKey: kCIInputRadiusKey) // 8~
//                getOutImage(filter, &filterImageArray)
//            case "CIGaussianBlur":
//                filter.setValue(NSNumber(value: 50), forKey: kCIInputRadiusKey) // 10~
//                getOutImage(filter, &filterImageArray)
//            case "CIMaskedVariableBlur":
//                filter.setValue(getCIImage(UIImage(named: "testImage.jpg")!), forKey: kCIInputMaskImageKey)
//                filter.setValue(NSNumber(value: 50), forKey: kCIInputRadiusKey) // 0~100
//                getOutImage(filter, &filterImageArray)
//            case "CIMedianFilter":
//                getOutImage(filter, &filterImageArray)
//            case "CIMotionBlur":
//                filter.setValue(NSNumber(value: 50), forKey: kCIInputRadiusKey) // 20~
//                filter.setValue(NSNumber(value: 0), forKey: kCIInputAngleKey) // 0
//                getOutImage(filter, &filterImageArray)
//
////            case "CIColorCubeWithColorSpace":
////            case "CIColorInvert":
////            case "CIColorMap":
////            case "CIColorMonochrome":
////            case "CIColorPosterize":
////            case "CIFalseColor":
////            case "CIMaskToAlpha":
//
//            default:
//                filterImageArray.append(originalImage)
//            }
//        }

    }
}
