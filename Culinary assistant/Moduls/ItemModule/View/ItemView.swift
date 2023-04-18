//
//  ItemView.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 26.02.2023.
//

import UIKit

class ItemView: UIView {
    
    // MARK: - Properties
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var myContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var topImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black.withAlphaComponent(0.8)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var timeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "timeImage")
        return image
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black.withAlphaComponent(0.8)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
    lazy var groupStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        [verticalStackView, horizontalStackView].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 0
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        [nameLabel, typeLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        [timeImage, timeLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var buyButton: GreenButton = {
        let button = GreenButton(title: "Добавить в покупки")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        tableView.isScrollEnabled = false
        tableView.showsHorizontalScrollIndicator = false
        return tableView
    }()
    
    lazy var complainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hex: "BA1A1A")
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "Пожаловаться"
        return label
    }()
    
    lazy var complainImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "complainImage")
        return image
    }()
    
    lazy var complainStackView: UIStackView = {
        let stack = UIStackView()
        [complainImage, complainLabel].forEach { stack.addArrangedSubview($0) }
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var contentViewHeight = myContentView.heightAnchor.constraint(equalTo: self.heightAnchor)
    lazy var contentViewWidth = myContentView.widthAnchor.constraint(equalTo: self.widthAnchor)
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentViewHeight.priority = .defaultLow
        contentViewWidth.priority = UILayoutPriority(1000)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions

extension ItemView {
    private func addSubview() {
        addSubview(scrollView)
        scrollView.addSubview(myContentView)
        
        [topImage, groupStackView, buyButton, tableView, complainStackView].forEach { subview in myContentView.addSubview(subview) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            myContentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            myContentView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor),
            myContentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            myContentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            
            contentViewWidth,
            contentViewHeight,
            
            topImage.topAnchor.constraint(equalTo: myContentView.topAnchor),
            topImage.leadingAnchor.constraint(equalTo: myContentView.leadingAnchor),
            topImage.trailingAnchor.constraint(equalTo: myContentView.trailingAnchor),
            topImage.heightAnchor.constraint(equalToConstant: 200),
            
            groupStackView.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 20),
            groupStackView.leadingAnchor.constraint(equalTo: myContentView.leadingAnchor, constant: 16),
            groupStackView.trailingAnchor.constraint(equalTo: myContentView.trailingAnchor, constant: -16),
            
            timeImage.heightAnchor.constraint(equalToConstant: 24),
            timeImage.widthAnchor.constraint(equalToConstant: 24),
            
            buyButton.topAnchor.constraint(equalTo: groupStackView.bottomAnchor, constant: 20),
            buyButton.leadingAnchor.constraint(equalTo: myContentView.leadingAnchor, constant: 16),
            buyButton.trailingAnchor.constraint(equalTo: myContentView.trailingAnchor, constant: -16),
            buyButton.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: buyButton.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: myContentView.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: myContentView.trailingAnchor, constant: -16),
            
            complainStackView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            complainStackView.leadingAnchor.constraint(equalTo: myContentView.leadingAnchor, constant: 16),
            complainStackView.trailingAnchor.constraint(lessThanOrEqualTo: myContentView.trailingAnchor, constant: -16),
            complainStackView.bottomAnchor.constraint(equalTo: myContentView.bottomAnchor, constant: -16),
            
            complainImage.heightAnchor.constraint(equalToConstant: 24),
            complainImage.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupView() {
        self.backgroundColor = .systemBackground
    }
}
