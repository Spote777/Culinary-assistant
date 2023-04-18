//
//  RegistrationResponse.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 05.12.2022.
//

import Foundation

// MARK: - RegistrationResponse

struct RegistrationResponse: Codable {
    let email: String
    let id: Int
    let username, firstName, lastName: String

    enum CodingKeys: String, CodingKey {
        case email, id, username
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
