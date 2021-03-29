//
//  BigPhotoView.swift
//  NASA_photoviewer
//
//  Created by ILYA Karasev on 24.03.2021.
//

import UIKit

class BigPhotoView: UIView {

    var currentImageUrl: String
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
       
    }
}
