//
//  BigPhotoController.swift
//  NASA_photoviewer
//
//  Created by ILYA Karasev on 24.03.2021.
//

import UIKit

class BigPhotoController: UIViewController {

    var mainView = BigPhotoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    
    private func configView() {
        self.view = self.mainView
        self.navigationItem.title = "Big photo from Mars"
    }

}
