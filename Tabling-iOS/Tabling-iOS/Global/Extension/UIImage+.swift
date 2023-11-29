//
//  UIImage+.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/18.
//

import UIKit

import Kingfisher

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
}

extension UIImageView {
    func kfSetImage(url: String?){
        guard let url = url else { return }
        if let url = URL(string: url) {
            kf.indicatorType = .activity
            kf.setImage(with: url,
                        placeholder: nil,
                        options: [.transition(.fade(1.0))],
                        progressBlock: nil)
        }
    }
}
