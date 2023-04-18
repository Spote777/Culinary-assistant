//
//  TagsResponse.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 05.12.2022.
//

import Foundation

// MARK: - TagsResponse

struct TagsResponseElement: Codable {
    let id: Int
    let name, color, slug: String
}

typealias TagsResponse = [TagsResponseElement]
