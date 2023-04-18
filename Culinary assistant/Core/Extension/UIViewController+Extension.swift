//
//  UIViewController+Extension.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 31.01.2023.
//

import UIKit

extension UIViewController {
    
    func changeRootVC(withIdentifier: String) {
        guard let window = UIApplication.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 }).first?.windows.first else {return}
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyboard.instantiateViewController(withIdentifier: withIdentifier)
        window.rootViewController = vc
        window.makeKeyAndVisible()
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.3
        
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: { completed in })
    }
    
    func changeRootVCWithNavController(identifier: String) {
        guard let window = UIApplication.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 }).first?.windows.first else {return}
        let storyboard = UIStoryboard(name: "Main", bundle:nil)
        let nav = storyboard.instantiateViewController(withIdentifier: identifier)
        window.rootViewController = nav
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.3
        
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: { completed in })
    }
    
    func presentAlert(title: String?, message: String?, actionTitles:[String?], actionStyle:[UIAlertAction.Style], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: actionStyle[index], handler: actions[index])
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
}
