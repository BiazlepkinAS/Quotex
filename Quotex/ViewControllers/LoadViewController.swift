//
//  LoadViewController.swift
//  Quotex
//
//  Created by Andrei Bezlepkin on 17.03.22.
//

import UIKit

class LoadViewController: UINavigationController {
    
    private var minValue = 0
    private let maxValue = 100
    private var downLoader = Timer()
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector")
        return image
    }()
    
    private lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.progressTintColor = UIColor(red: 0, green: 180/255, blue: 110/255, alpha: 1)
        view.trackTintColor = .white
        return view
    }()
    private lazy var progressBack: UIView = {
        let backView = UIView()
        backView.layer.cornerRadius = 10
        backView.backgroundColor = .clear
        backView.layer.borderWidth = 1
        backView.layer.borderColor = UIColor.lightGray.cgColor
        return backView
    }()
    
    private lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = ""
        label.textColor = .black
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.isHidden = true
        
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
        
        view.addSubview(progressBack)
        progressBack.translatesAutoresizingMaskIntoConstraints = false
        progressBack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -81).isActive = true
        progressBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 63).isActive = true
        progressBack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -63).isActive = true
        progressBack.heightAnchor.constraint(equalToConstant: 19).isActive = true
        progressBack.clipsToBounds = true
        
        progressBack.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.topAnchor.constraint(equalTo: progressBack.topAnchor,constant: -3).isActive = true
        progressView.leadingAnchor.constraint(equalTo: progressBack.leadingAnchor, constant: -1).isActive = true
        progressView.trailingAnchor.constraint(equalTo: progressBack.trailingAnchor, constant: 1).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        view.addSubview(percentLabel)
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.topAnchor.constraint(equalTo: progressView.topAnchor, constant: 3).isActive = true
        percentLabel.bottomAnchor.constraint(equalTo: progressView.bottomAnchor, constant: -3).isActive = true
        percentLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor).isActive = true
        percentLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        downloadProgress()
        
    }
    
    private func downloadProgress() {
        downLoader = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: (#selector(updater)), userInfo: nil, repeats: true)
        progressView.setProgress(0, animated: false)
    }
    
    @objc func updater() {
        if minValue != maxValue {
            minValue += 1
            percentLabel.text = "\(minValue) %"
            progressView.progress = Float(minValue) / Float(maxValue)
            
        } else {
            minValue = 0
            downLoader.invalidate()
            present(MainViewController(), animated: true)
        }
    }
}
