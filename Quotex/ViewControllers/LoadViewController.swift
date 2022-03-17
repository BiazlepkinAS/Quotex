//
//  LoadViewController.swift
//  Quotex
//
//  Created by Andrei Bezlepkin on 17.03.22.
//

import UIKit

class LoadViewController: UIViewController {
    
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
        view.progressTintColor = .green
        view.trackTintColor = .white
        return view
    }()
    
    private lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = ""
        label.textColor = .black
        label.backgroundColor = .clear
//        label.font = UIFont(name: "", size: 14)
        return label
    }()
    private lazy var percentSight: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "%"
        label.textColor = .black
//        label.font = UIFont(name: "", size: 14)
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
        progressView.setProgress(0, animated: true)
        
        view.addSubview(percentLabel)
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.topAnchor.constraint(equalTo: progressView.topAnchor, constant: 3).isActive = true
        percentLabel.bottomAnchor.constraint(equalTo: progressView.bottomAnchor, constant: -3).isActive = true
        percentLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor).isActive = true
        percentLabel.widthAnchor.constraint(equalToConstant: 33).isActive = true
        percentLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        view.addSubview(percentSight)
        percentSight.translatesAutoresizingMaskIntoConstraints = false
        percentSight.leadingAnchor.constraint(equalTo: percentLabel.trailingAnchor, constant: 3).isActive = true
        percentSight.topAnchor.constraint(equalTo: progressView.topAnchor, constant: 3).isActive = true
        percentSight.bottomAnchor.constraint(equalTo: progressView.bottomAnchor, constant: -3).isActive = true
        
        
        
        downloadProgress()
        
    }
    
    private func downloadProgress() {
        downLoader = Timer.scheduledTimer(timeInterval: 0.06, target: self, selector: (#selector(updater)), userInfo: nil, repeats: true)
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
        }
        
        
    }

}
