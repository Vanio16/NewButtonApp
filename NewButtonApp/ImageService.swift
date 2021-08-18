//
//  ImageService.swift
//  ButtonApp
//
//  Created by Ivan Zakharov on 9/12/20.
//

import Foundation
import UIKit

class ImageService {
    static var shared: ImageService = {
        let instance = ImageService()
        return instance
    }()
    var numberBackgroundImage = 0
    func getImage() -> UIImage? {
        if numberBackgroundImage >= 3 {
            numberBackgroundImage = 0
        }
        switch numberBackgroundImage {
            case 0: return UIImage(named: "first")
            case 1: return UIImage(named: "second")
            case 2: return UIImage(named: "third")
            default: return UIImage(named: "first")
        }
    }
}
