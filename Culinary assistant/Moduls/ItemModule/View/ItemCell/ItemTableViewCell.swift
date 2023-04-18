//
//  ItemTableViewCell.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 03.03.2023.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    var ingredientModel: FoodModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupTableView()
    }
    
    private func setupUI() {
        configureView()
        configureImageView()
        configureLabel()
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
    
    private func configureLabel() {
        sectionLabel.font = UIFont.systemFont(ofSize: 16)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "IngredientTableViewCell", bundle: nil), forCellReuseIdentifier: "IngredientTableViewCell")
        tableView.isScrollEnabled = false
        tableView.isUserInteractionEnabled = false
    }
    
    func showTableView() {
        tableViewHeight.constant = tableView.contentSize.height
        tableView.contentInsetAdjustmentBehavior = .never
        arrowImageView.transform = CGAffineTransform(rotationAngle: .pi / -2)
    }
    
    func hideTableView() {
        tableViewHeight.constant = 0
        arrowImageView.transform = CGAffineTransform(rotationAngle: .zero)
    }
}

extension ItemTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientModel?.ingredients.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientTableViewCell", for: indexPath) as? IngredientTableViewCell else { return UITableViewCell() }
        guard let model = ingredientModel?.ingredients[indexPath.row] else { return UITableViewCell() }
        cell.configureIngredientCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .zero
    }
}
