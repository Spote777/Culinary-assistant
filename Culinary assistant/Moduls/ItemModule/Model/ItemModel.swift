//
//  ItemModel.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 26.02.2023.
//

import Foundation

// MARK: - ItemModel
struct ItemModelResponse: Codable {
    let id: Int
    let tags: [Tag?]
    let author: Author
    let ingredients: [Ingredient]
    let isFavorited, isInShoppingCart: Bool?
    let name: String?
    let image: String?
    let text: String?
    let cookingTime: Int?

    enum CodingKeys: String, CodingKey {
        case id, tags, author, ingredients
        case isFavorited = "is_favorited"
        case isInShoppingCart = "is_in_shopping_cart"
        case name, image, text
        case cookingTime = "cooking_time"
    }
}
