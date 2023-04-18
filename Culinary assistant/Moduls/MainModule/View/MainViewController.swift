//
//  MainViewController.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 06.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainView = MainView()
    var presenter: MainViewPresenterProtocol?
    
    var categoryModel = [String()] {
        willSet {
            mainView.categoryCollectionView.reloadData()
        }
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        categoryModel = ["Все", "Завтрак", "Обед", "Ужин"]
    }
    
    private func setupView() {        
        mainView.categoryCollectionView.delegate = self
        mainView.categoryCollectionView.dataSource = self
        mainView.categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        
        mainView.mainCollectionView.delegate = self
        mainView.mainCollectionView.dataSource = self
        mainView.mainCollectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
    }
    
    deinit {
        print("deinit")
    }
}

extension MainViewController: MainViewProtocol {
    func success() {
        mainView.mainCollectionView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}
