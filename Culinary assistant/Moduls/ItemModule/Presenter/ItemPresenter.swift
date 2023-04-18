//
//  ItemPresenter.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 03.03.2023.
//

import Foundation

protocol ItemViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol ItemViewPresenterProtocol: AnyObject {
    init(view: ItemViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, foodId: String?)
    var foodModel: FoodModel? { get set }
    var foodId: String? { get set }
    var sectionLabel: [String] { get set }
    func setFood()
    func setSectionLabel()
}

class ItemPresenter: ItemViewPresenterProtocol {   
    var sectionLabel: [String] = []
    var foodModel: FoodModel?
    var foodId: String?
    weak var view: ItemViewProtocol?
    let networkService: NetworkServiceProtocol
    var router: RouterProtocol?
    
    required init(view: ItemViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, foodId: String?) {
        self.view = view
        self.networkService = networkService
        self.foodId = foodId
        self.router = router
    }
    
    func setSectionLabel() {
        sectionLabel = ["Ингредиенты", "Описание"]
    }
    
    func setFood() {
        networkService.recipedByID(id: foodId ?? "\(0)") { [weak self] item in
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
}

