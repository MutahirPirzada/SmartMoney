//
//  CustomRoundedView.swift
//  ConsumerMobileApp
//
//  Created by Usman Nisar on 22/11/2016.
//  Copyright © 2016 Usman. All rights reserved.
//

import UIKit

class CustomRoundedView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        //
        self.setupView()
    }
    
    func setupView () {
        
        self.layer.cornerRadius = CGFloat(8.0)
        self.layer.masksToBounds = true
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        
        self.backgroundColor = UIColor.white
    }
}
