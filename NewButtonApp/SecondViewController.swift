//
//  newViewController.swift
//  ButtonApp
//
//  Created by Ivan Zakharov on 9/12/20.
//

import UIKit

class SecondViewController: UIViewController {
    var imageService: ImageService = ImageService.shared
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var delegate: isAbleToReceiveData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.image  = imageService.getImage()
    }
    
    @IBAction func changeBackButton(_ sender: Any) {
        imageService.numberBackgroundImage += 1
        backgroundImage.image  = imageService.getImage()
    }
    
    @IBAction func goBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
