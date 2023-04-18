//
//  MainModel.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 05.12.2022.
//

import Foundation

// MARK: - MainModelResponse
struct FoodsModel: Codable {
    let count: Int
    let next, previous: String?
    let results: [FoodModel?]
}

// MARK: - Result
struct FoodModel: Codable {
    let id: Int
    let tags: [Tag]
    let author: Author
    let ingredients: [Ingredient]
    let isFavorited, isInShoppingCart: Bool
    let name: String
    let image: String
    let text: String
    let cookingTime: Int

    enum CodingKeys: String, CodingKey {
        case id, tags, author, ingredients
        case isFavorited = "is_favorited"
        case isInShoppingCart = "is_in_shopping_cart"
        case name, image, text
        case cookingTime = "cooking_time"
    }
}

// MARK: - Author
struct Author: Codable {
    let email: String
    let id: Int
    let countRecipes: Int
    let username, firstName, lastName: String
    let avatar: String?
    let isSubscribed: Bool

    enum CodingKeys: String, CodingKey {
        case email, id, username, avatar
        case firstName = "first_name"
        case lastName = "last_name"
        case isSubscribed = "is_subscribed"
        case countRecipes = "count_recipes"
    }
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let id: Int
    let name, measurementUnit: String
    let amount: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case measurementUnit = "measurement_unit"
        case amount
    }
}

// MARK: - Tag
struct Tag: Codable {
    let id: Int
    let name, color, slug: String
}
