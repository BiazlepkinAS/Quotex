//
//  ViewController.swift
//  Quotex
//
//  Created by Andrei Bezlepkin on 17.03.22.
//

import UIKit

class MainViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        
    }
    
    private func prepareUI() {
        
        self.view.backgroundColor = .red
        navigationBar.isHidden = true
        self.modalPresentationStyle = .fullScreen
    }
}

