//
//  PhotoCell.swift
//  NASA_photoviewer
//
//  Created by ILYA Karasev on 23.03.2021.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let reuseId = "Photo Cell"
    
    var photoView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.backgroundColor = .white
        
        addSubview(photoView)
        photoView.contentMode = .scaleToFill
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoView.pin.all()
    }
}
