//
//  CancelCollectionView.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/23.
//

import UIKit

import SnapKit

final class CancelCollectionView: UIView {
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .TablingWhite
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
