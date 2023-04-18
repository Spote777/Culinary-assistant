//
//  NetworkMonitor.swift
//  InAgent
//
//  Created by Павел Заруцков on 24.01.2022.
//

import Foundation
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
