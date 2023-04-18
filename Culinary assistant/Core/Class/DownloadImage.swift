//
//  DownloadImage.swift
//  Culinary assistant
//
//  Created by Павел Заруцков on 06.12.2022.
//

import UIKit
import Kingfisher

class DownloadImage {
    func downloadImage(imagePath: String?, imageView: UIImageView) {
        if let imageString = imagePath {
            guard let urlImage = URL(string: imageString) else {
                imageView.kf.indicator?.startAnimatingView()
                return
            }
            imageView.kf.indicatorType = .activity
            DispatchQueue.main.async {
                imageView.kf.setImage(with: urlImage)
            }
        }
    }
}
