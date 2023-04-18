//
//  MainViewController+Extension.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 18.02.2023.
//

import UIKit

// MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainView.mainCollectionView {
            return presenter?.foodModel?.results.count ?? 0
        } else {
            return categoryModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainView.mainCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
            guard let model = presenter?.foodModel?.results[indexPath.item] else { return UICollectionViewCell() }
            cell.configureCell(model: model)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            let model = categoryModel[indexPath.item]
            cell.configureCell(model: model)
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainView.mainCollectionView {
            guard let model = presenter?.foodModel?.results[indexPath.item] else {return}
            presenter?.tapOnTheFood(foodId: "\(model.id)")
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainView.mainCollectionView {
            let yourWidth = collectionView.bounds.width
            //            let yourHeight = collectionView.bounds.height/2
            return CGSize(width: yourWidth, height: 400)
        } else {
            return CGSize(width: 120, height: 40)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == mainView.mainCollectionView {
            return UIEdgeInsets.zero
        } else {
            return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == mainView.categoryCollectionView {
            return 5
        } else {
            return 0
        }
    }
}
