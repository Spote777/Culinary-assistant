//
//  MainPresenter.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 26.02.2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    var foodModel: FoodsModel? { get set }
    func getFoods()
    func tapOnTheFood(foodId: String?)
}

class MainPresenter: MainViewPresenterProtocol {
    var foodModel: FoodsModel?
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol
    var router: RouterProtocol?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getFoods()
    }
    
    func getFoods() {
        networkService.recipesList { [weak self] item in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch item {
                case .success(let item):
                    self.foodModel = item
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func tapOnTheFood(foodId: String?) {
        router?.showFood(foodId: foodId)
    }
}
