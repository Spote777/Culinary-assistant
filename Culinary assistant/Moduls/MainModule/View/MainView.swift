//
//  MainView.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 26.02.2023.
//

import UIKit

class MainView: UIView {
    var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.alwaysBounceHorizontal = true
        cv.showsHorizontalScrollIndicator = false
        cv.allowsMultipleSelection = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delaysContentTouches = false
        cv.showsVerticalScrollIndicator = false
        cv.alwaysBounceVertical = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Поиск"
        searchBar.autocorrectionType = .no
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(searchBar)
        addSubview(categoryCollectionView)
        addSubview(mainCollectionView)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            categoryCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            categoryCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categoryCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 50),
            
            mainCollectionView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor),
            mainCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupView() {
        self.backgroundColor = .systemBackground
    }
}
