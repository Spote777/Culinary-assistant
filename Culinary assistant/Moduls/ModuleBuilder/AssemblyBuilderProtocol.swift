//
//  AssemblyBuilderProtocol.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 26.02.2023.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMainFoodsModule(router: RouterProtocol) -> UIViewController
    func createDetailFoodModule(foodId: String?, router: RouterProtocol) -> UIViewController
}
