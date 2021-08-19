//
//  Coordinator.swift
//  NewButtonApp
//
//  Created by Ivan Zakharov on 19/8/21.
//

import Foundation
import UIKit

final class Coordinator: ViewControllerOutput, SecondViewControllerOutput {
    
    let window: UIWindow
    let navigationController: UINavigationController
    let firstViewController = ViewController()
    let secondViewController = SecondViewController()
    
    init(window: UIWindow) {
        self.window = window
        navigationController = .init(rootViewController: firstViewController)
    }
    
    func start() {
        firstViewController.output = self
        secondViewController.output = self
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showSecondScreen() {
        navigationController.pushViewController(secondViewController, animated: true)
    }
    
    func showFirstScreen() {
        navigationController.popViewController(animated: true)
    }
}
