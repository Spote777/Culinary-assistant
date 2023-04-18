//
//  Singleton.swift
//  InstaLite
//
//  Created by Павел Заруцков on 24.08.2022.
//

import Foundation

final class Session {
    
    static let instance = Session()
    private init() {}
    
    var token: String?
}
