//
//  ViewController.swift
//  PhotoFliterDemo
//
//  Created by Qi on 2020/9/22.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import CoreImage
class ViewController: UIViewController {

//    lazy var tableView: UITableView = {
//        let view = UITableView.init(frame: CGRect.zero, style: .plain)
//        view.delegate = self
//        view.dataSource = self
//        return view
//    }()
    
    let image = UIImage.init(named: "testImage.jpg")
    let imageView1 = UIImageView()
    let imageView2 = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        imageView1.image = image
        imageView1.frame = CGRect.init(x: 50, y: 50, width: 300, height: 300)
        view.addSubview(imageView1)
        
        imageView2.image = image
        imageView2.frame = CGRect.init(x: 50, y: 350, width: 300, height: 300)
        view.addSubview(imageView2)
        
        let image1 = CIImage.init(cgImage: (image?.cgImage)!)
        let fl = CIFilter.filterNames(inCategory: kCICategoryStillImage)
        print(fl)
        let filter = CIFilter.init(name: "CIMaskedVariableBlur")
        
        filter?.setValue(image1, forKey: kCIInputImageKey)
        filter?.setValue(NSNumber.init(value: 10), forKey: kCIInputRadiusKey)
        filter?.setValue(image1, forKey: "inputMask")

        let out = filter?.outputImage
        let context = CIContext.init(options: nil)
        let cgimage = context.createCGImage(out!, from: out!.extent)
        let filter_image = UIImage.init(cgImage: cgimage!)
        imageView1.image = filter_image
    }

}

/*
 kCICategoryBlur:
 ["CIBokehBlur", "CIBoxBlur", "CIDepthBlurEffect", "CIDiscBlur", "CIGaussianBlur", "CIMaskedVariableBlur", "CIMedianFilter", "CIMorphologyGradient", "CIMorphologyMaximum", "CIMorphologyMinimum", "CIMorphologyRectangleMaximum", "CIMorphologyRectangleMinimum", "CIMotionBlur", "CINoiseReduction", "CIZoomBlur"]
 
 
 kCICategoryColorAdjustment:
 ["CIColorClamp", "CIColorControls", "CIColorMatrix", "CIColorPolynomial", "CIDepthToDisparity", "CIDisparityToDepth", "CIExposureAdjust", "CIGammaAdjust", "CIHueAdjust", "CILinearToSRGBToneCurve", "CISRGBToneCurveToLinear", "CITemperatureAndTint", "CIToneCurve", "CIVibrance", "CIWhitePointAdjust"]
 
 
 
 */

