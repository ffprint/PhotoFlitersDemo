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

    private var _dataSource = ["CICategoryBlur",
                               "CICategoryColorAdjustment",
                               "CICategoryColorEffect",
                               "CICategoryCompositeOperation",
                               "CICategoryDistortionEffect",
                               "CICategoryGenerator",
                               "CICategoryGeometryAdjustment",
                               "CICategoryGradient",
                               "CICategoryHalftoneEffect",
                               "CICategoryReduction",
                               "CICategorySharpen",
                               "CICategoryStylize",
                               "CICategoryTileEffect",
                               "CICategoryTransition"]

    override var dataSource: [String] {
        get { _dataSource }
        set { _dataSource = newValue }
    }

    let image = UIImage(named: "testImage.jpg")
    let imageView1 = UIImageView()
    let imageView2 = UIImageView()
    let filter = CIFilter(name: "CIMaximumComponent")
    let context = CIContext(options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        let image1 = CIImage.init(cgImage: (image?.cgImage)!)
//
//        filter?.setValue(image1, forKey: kCIInputImageKey)
//        filter?.setValue(NSNumber.init(value: 10), forKey: kCIInputRadiusKey)
//
//        let out = filter?.outputImage
//        let cgimage = context.createCGImage(out!, from: out!.extent)
//        let filter_image = UIImage.init(cgImage: cgimage!)
//        imageView1.image = filter_image
        
    }
}

extension MainViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        
        let filters = FlitersViewController()
        filters.title = dataSource[indexPath.row]
        filters.category = dataSource[indexPath.row]
        self.navigationController?.pushViewController(filters, animated: true)
    }
}

/*
 kCICategoryBlur:

 ["CIBokehBlur",
 "CIBoxBlur",
 "CIDepthBlurEffect",
 "CIDiscBlur",
 "CIGaussianBlur",
 "CIMaskedVariableBlur",
 "CIMedianFilter",
 "CIMorphologyGradient",
 "CIMorphologyMaximum",
 "CIMorphologyMinimum",
 "CIMorphologyRectangleMaximum",
 "CIMorphologyRectangleMinimum",
 "CIMotionBlur",
 "CINoiseReduction",
 "CIZoomBlur"]

 kCICategoryColorAdjustment:

 ["CIColorClamp",
 "CIColorControls",
 "CIColorMatrix",
 "CIColorPolynomial",
 "CIDepthToDisparity",
 "CIDisparityToDepth",
 "CIExposureAdjust",
 "CIGammaAdjust",
 "CIHueAdjust",
 "CILinearToSRGBToneCurve",
 "CISRGBToneCurveToLinear",
 "CITemperatureAndTint",
 "CIToneCurve",
 "CIVibrance",
 "CIWhitePointAdjust"]

 */
