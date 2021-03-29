//
//  PhotoView.swift
//  NASA_photoviewer
//
//  Created by ILYA Karasev on 23.03.2021.
//

import UIKit
import PinLayout

class PhotoView: UIView {

    let photoCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    let layout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        photoCollectionView.backgroundColor = .white
        addSubview(photoCollectionView)
        
        //MARK: collection view setup
        let width = UIScreen.main.bounds.width / 2.05
        layout.itemSize = CGSize(width: width, height: width)
        layout.sectionInset = UIEdgeInsets(top: 5.0, left: 3.0, bottom: 0.0, right: 3.0)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        photoCollectionView.showsVerticalScrollIndicator = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoCollectionView.pin.all()
    }

}
