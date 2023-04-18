//
//  AssemblyBuilder.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 26.02.2023.
//

import UIKit

class AssemblyBuilder: AssemblyBuilderProtocol {
    func createMainFoodsModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailFoodModule(foodId: String?, router: RouterProtocol) -> UIViewController {
        let view = ItemViewController()
        let networkService = NetworkService()
        let presenter = ItemPresenter(view: view, networkService: networkService, router: router, foodId: foodId)
        view.presenter = presenter
        return view
    }
}
