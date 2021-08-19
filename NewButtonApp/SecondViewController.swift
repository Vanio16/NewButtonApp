//
//  newViewController.swift
//  ButtonApp
//
//  Created by Ivan Zakharov on 9/12/20.
//

import UIKit
import Framezilla

protocol SecondViewControllerOutput {
    func showFirstScreen()
}

final class SecondViewController: UIViewController {
    var output: SecondViewControllerOutput?
    var imageService: ImageService = ImageService.shared
    
    private struct Constants {
        static let refreshButtonSize: CGSize = .init(width: 44, height: 44)
        static let refreshButtonInsetTop: CGFloat = 10
        static let changeScreenButtonInsetTop: CGFloat = 30
    }
    
    private let refreshButton: UIButton = {
        let button = UIButton()
        let refreshImage = UIImage(named: "cached-24px")
        button.addTarget(self, action: #selector(changeBackButton), for: .touchUpInside)
        button.setImage(refreshImage, for: .normal)
        return button
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Назад", for: .normal)
        button.addTarget(self, action: #selector(goBackButton), for: .touchUpInside)
        return button
    }()
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.add(backgroundImage, refreshButton, backButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        backgroundImage.image  = imageService.getImage()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        refreshButton.configureFrame { maker in
            maker.centerY()
                .centerX()
                .size(Constants.refreshButtonSize)
        }
        
        backButton.configureFrame { maker in
            maker.centerX()
                .top(to: refreshButton.nui_bottom, inset: Constants.changeScreenButtonInsetTop)
                .sizeToFit()
        }
        
        backgroundImage.configureFrame { maker in
            maker.top().bottom().right().left()
        }
    }
    
    @objc private func changeBackButton() {
        imageService.numberBackgroundImage += 1
        backgroundImage.image  = imageService.getImage()
    }
    
    @objc private func goBackButton() {
        output?.showFirstScreen()
    }
}
