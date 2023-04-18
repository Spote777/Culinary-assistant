//
//  Constants.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Foundation

struct NetworkConstants {
    struct ProductionServer {
        static let baseURL = "http://foodgram.rigel-mobile.ru/api"
    }
    
    struct APIParameterKey {
        static let email = "email"
        static let username = "username"
        static let firstName = "first_name"
        static let lastName = "last_name"
        static let password = "password"
        static let newPassword = "new_password"
        static let currentPassword = "current_password"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
