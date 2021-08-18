//
//  ViewController.swift
//  NewButtonApp
//
//  Created by Ivan Zakharov on 18/8/21.
//

import UIKit

class ViewController: UIViewController {

    let newView: UIView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(newView)
        newView.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        newView.frame = .init(x: 10, y: 10, width: 30, height: 50)
    }

}

