//
//  StoreDetatilImageScrollView.swift
//  Tabling-iOS
//
//  Created by 민 on 11/20/23.
//

import UIKit
import SnapKit

final class StoreDetatilImageScrollView: UIView {
    
    // MARK: - Properties
    var images = ["big", "big", "big"]
    
    // MARK: - UI Components
    private let imagescrollView: UIScrollView = {
        let scrollView = UIScrollView()
        // scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let waitingTeamLabel: UILabel = {
        let label = UILabel()
        label.text = "대기 2팀"
        label.backgroundColor = .TablingPrimary
        label.textColor = .TablingWhite
        return label
    }()
    
    private let photoCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setDelegate()
        scrollWithImageView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension StoreDetatilImageScrollView {
    func setHierarchy() {
        self.addSubview(imagescrollView)
        imagescrollView.addSubview(contentView)
    }
    
    func setLayout() {
        imagescrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let width = UIScreen.main.bounds.width
        contentView.snp.makeConstraints {
            $0.edges.equalTo(imagescrollView.contentLayoutGuide)
            $0.height.equalTo(imagescrollView.frameLayoutGuide)
            $0.width.equalTo(width * CGFloat(images.count))
        }
        

    }
    
    func setDelegate() {
        // imagescrollView.delegate = self
    }
    
    func scrollWithImageView() {
        for index in 0..<images.count {
            let imageView = UIImageView()
            let positionX = self.frame.width * CGFloat(index)
            
            imageView.frame = CGRect(x: positionX, y: self.frame.height, width: self.bounds.width, height: self.bounds.height)
            imageView.contentMode = .scaleAspectFit
            
            contentView.addSubview(imageView)

        }
    }
}
