//
//  IngredientTableViewCell.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 23.03.2023.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var measurementLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        measurementLabel.font = UIFont.systemFont(ofSize: 16)
        amountLabel.font = UIFont.systemFont(ofSize: 16)
    }
    
    func configureIngredientCell(model: Ingredient) {
        nameLabel.text = model.name
        measurementLabel.text = model.measurementUnit
        amountLabel.text = "\(model.amount)"
    }
}
