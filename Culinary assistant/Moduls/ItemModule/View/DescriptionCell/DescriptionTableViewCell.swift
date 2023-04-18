//
//  DescriptionTableViewCell.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 23.03.2023.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        configureImageView()
        configureView()
        configureLabel()
    }
    
    private func configureLabel() {
        sectionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
    }
    
    private func configureView() {
        myContentView.layer.borderColor = UIColor(hex: "C1C9BE").cgColor
        myContentView.layer.borderWidth = 1
        myContentView.clipsToBounds = true
        myContentView.layer.cornerRadius = 16
        selectionStyle = .none
    }
    
    private func configureImageView() {
        arrowImageView.image = UIImage(named: "closeCellImage")
    }
    
    func configureIngredientCell(model: String) {
        descriptionLabel.text = model
    }
    
    func showLabel() {
        descriptionLabel.isHidden = false
        arrowImageView.transform = CGAffineTransform(rotationAngle: .pi / -2)
    }
    
    func hideLabel() {
        descriptionLabel.isHidden = true
        arrowImageView.transform = CGAffineTransform(rotationAngle: .zero)
    }
}
