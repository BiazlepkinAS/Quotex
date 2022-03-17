//
//  LoadViewController.swift
//  Quotex
//
//  Created by Andrei Bezlepkin on 17.03.22.
//

import UIKit

class LoadViewController: UIViewController {
    
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector")
        return image
    }()
    
    private lazy var progressView: CustomProgressView = {
        let view = CustomProgressView()
        return view
    }()
    
    private lazy var percentLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    
    
    let customBackGround = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        
        prepareUI()

    }
    
    private func prepareUI() {
        
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 110).isActive = true
        logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -110).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 155).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 181).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -81).isActive = true
        progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 63).isActive = true
        progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -63).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 19).isActive = true
        progressView.backgroundColor = .red
        
        view.addSubview(<#T##view: UIView##UIView#>)
        
        
        
    }
    
    

}
