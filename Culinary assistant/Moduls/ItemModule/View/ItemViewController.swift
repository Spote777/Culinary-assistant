//
//  ItemViewController.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 26.02.2023.
//

import UIKit

class ItemViewController: UIViewController {
    
    var expandedIndexSet : IndexSet = []
    
    var itemView = ItemView()
    var presenter: ItemViewPresenterProtocol?
    
    override func loadView() {
        super.loadView()
        view = itemView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.setFood()
        presenter?.setSectionLabel()
    }
    
    private func setupView() {
        itemView.tableView.dataSource = self
        itemView.tableView.delegate = self
        itemView.tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        itemView.tableView.register(UINib(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "DescriptionTableViewCell")
        itemView.tableView.register(UINib(nibName: "AuthorTableViewCell", bundle: nil), forCellReuseIdentifier: "AuthorTableViewCell")
    }
}

extension ItemViewController: ItemViewProtocol {
    func success() {
        guard let food = presenter?.foodModel else {return}
        itemView.nameLabel.text = food.author.username
        DownloadImage().downloadImage(imagePath: food.image, imageView: itemView.topImage)
        itemView.timeLabel.text = "\(food.cookingTime) минут"
        itemView.tableView.reloadData()
        itemView.typeLabel.text = food.tags.first?.name
    }
    
    func failure(error: Error) {
        print("ERROR")
    }
}

extension ItemViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
            cell.sectionLabel.text = presenter?.sectionLabel[indexPath.row]
            if let ingredientModel = presenter?.foodModel {
                cell.ingredientModel = ingredientModel
            }
            if expandedIndexSet.contains(indexPath.row) {
                cell.showTableView()
            } else {
                cell.hideTableView()
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as? DescriptionTableViewCell else { return UITableViewCell() }
            cell.sectionLabel.text = presenter?.sectionLabel[indexPath.row]
            if let descriptionText = presenter?.foodModel {
                cell.configureIngredientCell(model: descriptionText.text)
            }
            if expandedIndexSet.contains(indexPath.row) {
                cell.showLabel()
            } else {
                cell.hideLabel()
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorTableViewCell", for: indexPath) as? AuthorTableViewCell else { return UITableViewCell() }
            guard let model = presenter?.foodModel else {return UITableViewCell() }
            cell.configureCell(model: model)
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        if indexPath.row != 2 {
            if(expandedIndexSet.contains(indexPath.row)) {
                expandedIndexSet.remove(indexPath.row)
            } else {
                expandedIndexSet.insert(indexPath.row)
            }
            itemView.tableView.reloadRows(at: [indexPath], with: .fade)
        } else {
            print("1")
        }
    }
}


