//
//  Photo.swift
//  Photos
//
//  Created by Casandra Grullon on 9/8/21.
//

import Foundation

struct Photo: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
