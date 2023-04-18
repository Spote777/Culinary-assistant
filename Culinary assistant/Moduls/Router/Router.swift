//
//  Router.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 26.02.2023.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var tabBarController: TabBarViewController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showFood(foodId: String?)
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    var tabBarController: TabBarViewController?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol, tabBarController: TabBarViewController) {
        self.assemblyBuilder = assemblyBuilder
        self.navigationController = navigationController
        self.tabBarController = tabBarController
    }
    
    func initialViewController() {
        if let tabBarController = tabBarController {
            guard let mainModule = assemblyBuilder?.createMainFoodsModule(router: self) else {return}
            mainModule.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName:"house.fill"))
            navigationController = UINavigationController(rootViewController: mainModule)
            tabBarController.viewControllers = [navigationController.unsafelyUnwrapped]
            
        }
    }
    
    func showFood(foodId: String?) {
        if let navigationController = navigationController {
            guard let itemModule = assemblyBuilder?.createDetailFoodModule(foodId: foodId, router: self) else {return}
            navigationController.pushViewController(itemModule, animated: true)
        }
    }
}
