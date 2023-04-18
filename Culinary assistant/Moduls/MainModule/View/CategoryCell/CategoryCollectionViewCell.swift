//
//  CategoryCollectionViewCell.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 31.01.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var categoryName: UILabel!
    
    override var isSelected: Bool {
        willSet {
            myContentView.backgroundColor = newValue ? UIColor.systemGreen : UIColor.clear
            myContentView.layer.borderWidth = newValue ? 0 : 1
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabel()
        setupView()
    }
    
    func configureCell(model: String) {
        categoryName.text = model
    }
    
    private func setupLabel() {
        categoryName.textAlignment = .center
        categoryName.textColor = .black
        categoryName.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    private func setupView() {
        myContentView.layer.cornerRadius = 10
        myContentView.clipsToBounds = true
        myContentView.layer.borderColor = UIColor.black.withAlphaComponent(0.8).cgColor
        myContentView.layer.borderWidth = 1
    }
}
