//
//  Image.swift
//  NASA_photoviewer
//
//  Created by ILYA Karasev on 23.03.2021.
//

import Foundation
import UIKit

extension UIImageView {
    
    func download(from imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                self?.image = UIImage(data: data)
            }
        }
        dataTask.resume()
    }
}
