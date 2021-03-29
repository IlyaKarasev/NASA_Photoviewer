//
//  PhotoModel.swift
//  NASA_photoviewer
//
//  Created by ILYA Karasev on 23.03.2021.
//

import Foundation

struct PhotoResponse: Codable {
    let latest_photos: [Photo]?
}

struct Photo: Codable {
    let id: Int?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case image = "img_src"
    }
}

