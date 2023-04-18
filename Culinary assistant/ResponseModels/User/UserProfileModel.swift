//
//  UserProfileResponse.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 05.12.2022.
//

import Foundation

// MARK: - UserProfileResponse

struct UserProfileResponse: Codable {
    let email: String
    let id: Int
    let username, firstName, lastName: String
    let isSubscribed: Bool
    let detail: String?
    
    enum CodingKeys: String, CodingKey {
        case email, id, username, detail
        case firstName = "first_name"
        case lastName = "last_name"
        case isSubscribed = "is_subscribed"
    }
}
