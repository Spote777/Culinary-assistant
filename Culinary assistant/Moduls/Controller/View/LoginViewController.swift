//
//  LoginViewController.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 04.12.2022.
//

import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.loginButton.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
    }
    
    @objc func tapLoginButton() {
        
    }
}
