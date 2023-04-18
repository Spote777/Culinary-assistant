//
//  MainCollectionViewCell.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 06.12.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var recipesNameLabel: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var timeImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var addButton: GreenButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
        configureImageView()
        setupButton()
        setupLabel()
    }
    
    override var isHighlighted: Bool {
        didSet {
            shrink(down: isHighlighted)
        }
    }
    
    private func shrink(down: Bool) {
        UIView.animate(withDuration: 0.2,
                       delay: 0.0,
                       options: [.allowUserInteraction]) {
            if down {
                self.contentView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            } else {
                self.contentView.transform = .identity
            }
        }
    }
    
    func configureCell(model: FoodModel) {
        DownloadImage().downloadImage(imagePath: model.image, imageView: mainImage)
        recipesNameLabel.text = model.name
        authorNameLabel.text = model.author.username
        timeLabel.text = "\(model.cookingTime) мин."
        foodTypeLabel.text = model.tags.first?.name
        if model.isFavorited == true {
            favoriteButton.isSelected = true
        } else {
            favoriteButton.isSelected = false
        }
    }
    
    private func configureView() {
        myContentView.layer.cornerRadius = 10.0
        myContentView.layer.shadowColor = UIColor.gray.cgColor
        myContentView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        myContentView.layer.shadowRadius = 5.0
        myContentView.layer.shadowOpacity = 0.7
        
    }
    
    private func configureImageView() {
        mainImage.clipsToBounds = true
        mainImage.layer.cornerRadius = 10
        mainImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainImage.contentMode = .scaleAspectFill
        
        authorImage.image = UIImage(systemName: "person")
        authorImage.tintColor = UIColor.black.withAlphaComponent(0.8)
        
        timeImage.image = UIImage(systemName: "clock")
        timeImage.tintColor = UIColor.black.withAlphaComponent(0.8)
    }
    
    private func setupButton() {
        addButton.setTitle("Добавить в покупки", for: .normal)
        favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        if favoriteButton.isSelected == true {
            favoriteButton.tintColor = .systemRed
        } else {
            favoriteButton.tintColor = .systemGreen

        }
        favoriteButton.backgroundColor = .white
        favoriteButton.clipsToBounds = true
        favoriteButton.layer.cornerRadius = favoriteButton.frame.width/2
    }

    private func setupLabel() {
        foodTypeLabel.textColor = .black.withAlphaComponent(0.8)
        timeLabel.textColor = .black.withAlphaComponent(0.8)
        authorNameLabel.textColor = .black.withAlphaComponent(0.8)
    }
}
