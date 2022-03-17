//
//  CustomProgressView.swift
//  Quotex
//
//  Created by Andrei Bezlepkin on 17.03.22.
//

import UIKit

class CustomProgressView: UIView {
    
    let progressLine = UIProgressView()

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        prepareUI()
        
    }
    
   private func prepareUI() {
        frame = CGRect(x: 0, y: 0, width: 248, height: 12)
       
       progressLine.progressViewStyle = .default
       progressLine.progressTintColor = .green
       progressLine.trackTintColor = .white
       progressLine.progressViewStyle = .default
       progressLine.progress = 0.1
       progressLine.setProgress(0.3, animated: true)
       progressLine.observedProgress = .discreteProgress(totalUnitCount: 1)
       self.addSubview(progressLine)
        
    }
    
    

}
