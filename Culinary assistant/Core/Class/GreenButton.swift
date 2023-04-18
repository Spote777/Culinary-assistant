//
//  GreenButton.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 19.02.2023.
//

import UIKit

class GreenButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.layer.cornerRadius = 16
        self.tintColor = .white
        self.setTitle(title, for: .normal)
        self.backgroundColor = .systemGreen
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 16
        self.tintColor = .white
        self.backgroundColor = .systemGreen
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
}
