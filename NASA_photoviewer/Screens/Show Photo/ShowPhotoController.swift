//
//  ViewController.swift
//  NASA_photoviewer
//
//  Created by ILYA Karasev on 26.03.2021.
//

import UIKit
import PinLayout

class ShowPhotoController: UIViewController {
    
    var imageScrollView: ImageScrollView!
    var currentImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageScrollView = ImageScrollView(frame: view.bounds)
        view.addSubview(imageScrollView)
        setupImageScrollView()
        
        self.imageScrollView.set(image: currentImage)
    }
    
    func setupImageScrollView() {
        imageScrollView.pin.all()
    }
}
