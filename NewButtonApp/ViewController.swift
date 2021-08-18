//
//  ViewController.swift
//  NewButtonApp
//
//  Created by Ivan Zakharov on 18/8/21.
//

import UIKit
import Framezilla
class ViewController: UIViewController {
    
    private struct Constants {
        static let textLabelInsetBottom: CGFloat = 20
        static let arrowButtonSize: CGSize = .init(width: 44, height: 44)
        static let textTextFieldHeight: CGFloat = 30
        static let textTextFieldInsetRight: CGFloat = 5
        static let textTextFieldInsetLeft: CGFloat = 10
        static let refreshButtonSize: CGSize = .init(width: 44, height: 44)
        static let refreshButtonInsetTop: CGFloat = 10
        static let arrowButtonInsetRight: CGFloat = 5
        static let changeScreenButtonInsetTop: CGFloat = 30
        
    }
    
    var imageService: ImageService = ImageService.shared
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .blue
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let textTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.textColor = .black
        return textField
    }()
    
    let backgroundImage: UIImageView = .init()
    
    private let arrowButton: UIButton = {
        let button = UIButton()
        let arrowImage = UIImage(named: "send-24px")
        button.setImage(arrowImage, for: .normal)
        button.addTarget(self, action: #selector(changeText), for: .touchUpInside)
        return button
    }()
    
    private let refreshButton: UIButton = {
        let button = UIButton()
        let refreshImage = UIImage(named: "cached-24px")
        button.addTarget(self, action: #selector(changeBackground), for: .touchUpInside)
        button.setImage(refreshImage, for: .normal)
        return button
    }()
    
    private let changeScreenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вперед", for: .normal)
        button.addTarget(self, action: #selector(showScreenButton), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImage)
        view.addSubview(textLabel)
        view.addSubview(textTextField)
        view.addSubview(arrowButton)
        view.addSubview(refreshButton)
        view.addSubview(changeScreenButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundImage.configureFrame{ maker in
            maker.top().bottom().right().left()
        }
        
        arrowButton.configureFrame{ maker in
            maker.size(Constants.arrowButtonSize)
                .right(to: view.nui_safeArea.right,inset: Constants.arrowButtonInsetRight).centerY()
        }
        textTextField.configureFrame{ maker in
            maker.centerY()
                .left(to: view.nui_safeArea.left, inset: Constants.textTextFieldInsetLeft)
                .right(to: arrowButton.nui_left, inset: Constants.textTextFieldInsetRight)
                .height(Constants.textTextFieldHeight)
        }
        
        refreshButton.configureFrame{ maker in
            maker.size(Constants.refreshButtonSize)
                .centerX()
                .top(to: textTextField.nui_bottom, inset: Constants.refreshButtonInsetTop)
        }
        changeScreenButton.configureFrame{ maker in
            maker.centerX()
                .top(to: refreshButton.nui_bottom, inset: Constants.changeScreenButtonInsetTop)
                .sizeToFit()
        }
        textLabel.configureFrame{ maker in
            maker.top(to: view.nui_safeArea.top)
                .right(to: view.nui_safeArea.right)
                .left(to: view.nui_safeArea.left)
                .bottom(to: textTextField.nui_top, inset: Constants.textLabelInsetBottom)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        backgroundImage.image  = imageService.getImage()
    }
    
    @objc private func showScreenButton() {
        let secondViewController = SecondViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    @objc private func changeText() {
        textLabel.text = textTextField.text
        view.endEditing(true)
    }
    @objc private func changeBackground() {
        imageService.numberBackgroundImage += 1
        backgroundImage.image  = imageService.getImage()
    }
    
}

