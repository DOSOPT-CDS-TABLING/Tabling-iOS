//
//  CustomTabBarHeaderView.swift
//  Tabling-iOS
//
//  Created by 민 on 12/4/23.
//

import UIKit

protocol CustomTabBarHeaderViewDelegate: AnyObject {
    func firstSegmentClicked()
    func secondSegmentClicked()
    func thirdSegmentClicked()
}

class CustomTabBarHeaderView: UIView {
    
    // MARK: - Properties
    
    weak var customTabBarHeaderViewDelegate: CustomTabBarHeaderViewDelegate?
    
    // MARK: - UI Components
    
    private let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.selectedSegmentTintColor = .clear
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        let titles = [
            I18N.StoreDetail.homeSegmentControlTitle,
            I18N.StoreDetail.menuSegmentControlTitle,
            I18N.StoreDetail.reviewSegmentControlTitle
        ]
        for (index, title) in titles.enumerated() {
            segment.insertSegment(withTitle: title, at: index, animated: true)
            segment.setWidth(92, forSegmentAt: index)
        }

        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.Gray200,
            .font: UIFont.pretendardSemiBold(size: 16)
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.Gray800,
            .font: UIFont.pretendardSemiBold(size: 16)
        ]
        segment.selectedSegmentIndex = 0
        segment.setTitleTextAttributes(normalAttributes, for: .normal)
        segment.setTitleTextAttributes(selectedAttributes, for: .selected)

        return segment
    }()
    
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .Gray600
        return view
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setAddTarget()
        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension CustomTabBarHeaderView {
    
    func setHierarchy() {
        self.addSubviews(segmentControl, underLineView)
    }
    
    func setLayout() {
        segmentControl.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(52)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.height.equalTo(34)
        }
        
        underLineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalTo(92)
            $0.height.equalTo(2)
            $0.leading.equalTo(segmentControl.snp.leading)
        }
    }
    
    func setAddTarget() {
        segmentControl.addTarget(self, action: #selector(didChangeValue(_:)), for: .allEvents)
    }
    
    @objc
    private func didChangeValue(_ segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            changeSegmentedControlLinePosition(selectedSegmentIndex: 0)
            customTabBarHeaderViewDelegate?.firstSegmentClicked()
        case 1:
            changeSegmentedControlLinePosition(selectedSegmentIndex: 1)
            customTabBarHeaderViewDelegate?.secondSegmentClicked()
        default:
            changeSegmentedControlLinePosition(selectedSegmentIndex: 2)
            customTabBarHeaderViewDelegate?.thirdSegmentClicked()
        }
    }
    
    func changeSegmentedControlLinePosition(selectedSegmentIndex: Int) {
        let leadingDistance = Int(92 * CGFloat(selectedSegmentIndex) + (92 - self.underLineView.bounds.width) * 0.5)
        UIView.animate(withDuration: 0.2, animations: {
            self.underLineView.snp.updateConstraints { $0.leading.equalTo(self.segmentControl.snp.leading).offset(leadingDistance) }
            self.layoutIfNeeded()
        })

    }
    
    func setRegisterCell() {
        
    }
    
    func setDataBind() {
        
    }
}
