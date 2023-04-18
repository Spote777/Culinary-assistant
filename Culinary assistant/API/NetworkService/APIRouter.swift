//
//  APIRouter.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    ///Users
    case login(email:String,
               password:String)
    case registration(email: String,
                      username: String,
                      firstName: String,
                      lastName: String,
                      password: String)
    case logout
    case changePassword(newPassword: String,
                        currentPassword: String)
    case userProfile(id: String)
    case myProfile
    ///Tags
    case tagsList
    case tagList(id: String)
    ///Recipes
    case recipesList
    case recipedByID(id: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        ///Users
        case .login:
            return .post
        case .registration:
            return .post
        case .logout:
            return .post
        case .changePassword:
            return .post
        case .userProfile:
            return .get
        case .myProfile:
            return .get
        ///Tags
        case .tagsList:
            return .get
        case .tagList:
            return .get
        ///Recipes
        case .recipesList:
            return .get
        case .recipedByID:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        ///Users
        case .login:
            return "/auth/token/login/"
        case .registration:
            return "/users/"
        case .logout:
            return "/auth/token/logout/"
        case .changePassword:
            return "/users/set_password/"
        case .userProfile(let id):
            return "/users/\(id)/"
        case .myProfile:
            return "/users/me/"
        ///Tags
        case .tagsList:
            return "/tags/"
        case .tagList(let id):
            return "/tags/\(id)/"
        ///Recipes
        case .recipesList:
            return "/recipes/"
        case .recipedByID(let id):
            return "/recipes/\(id)"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        ///Users
        case .login(let email,
                    let password):
            return [NetworkConstants.APIParameterKey.email: email,
                    NetworkConstants.APIParameterKey.password: password]
        case .registration(let email,
                           let username,
                           let firstName,
                           let lastName,
                           let password):
            return [NetworkConstants.APIParameterKey.email: email,
                    NetworkConstants.APIParameterKey.username: username,
                    NetworkConstants.APIParameterKey.firstName: firstName,
                    NetworkConstants.APIParameterKey.lastName: lastName,
                    NetworkConstants.APIParameterKey.password: password]
        case .logout:
            return nil
        case .changePassword(let newPassword,
                             let currentPassword):
            return [NetworkConstants.APIParameterKey.newPassword: newPassword,
                    NetworkConstants.APIParameterKey.currentPassword: currentPassword]
        case .userProfile:
            return nil
        case .myProfile:
            return nil
        ///Tags
        case .tagsList:
            return nil
        case .tagList:
            return nil
        ///Recipes
        case .recipesList:
            return nil
        case .recipedByID:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try NetworkConstants.ProductionServer.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        if Session.instance.token != nil {
            urlRequest.setValue("Token \(Session.instance.token ?? "")", forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        }
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}
