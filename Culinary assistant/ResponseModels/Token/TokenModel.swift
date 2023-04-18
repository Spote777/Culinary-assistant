//
//  TokenResponse.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 05.12.2022.
//

import Foundation

// MARK: - TokenResponse

struct TokenResponse: Codable {
    let authToken: String

    enum CodingKeys: String, CodingKey {
        case authToken = "auth_token"
    }
}
