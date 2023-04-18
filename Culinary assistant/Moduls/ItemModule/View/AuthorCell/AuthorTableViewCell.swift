//
//  AuthorTableViewCell.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 03.03.2023.
//

import UIKit

class AuthorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var recipeCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        myContentView.backgroundColor = UIColor(hex: "156D33").withAlphaComponent(0.08)
        myContentView.layer.cornerRadius = 20
        myContentView.clipsToBounds = true
        
        authorNameLabel.font = UIFont.systemFont(ofSize: 14)
        recipeCountLabel.font = UIFont.systemFont(ofSize: 11)
        recipeCountLabel.textColor = UIColor(hex: "727970")
        
        self.selectionStyle = .none
    }
    
    func configureCell(model: FoodModel) {
        authorNameLabel.text = model.author.username
        recipeCountLabel.text = "\(model.author.countRecipes)"
        DownloadImage().downloadImage(imagePath: model.author.avatar, imageView: authorImageView)
        
    }
}
