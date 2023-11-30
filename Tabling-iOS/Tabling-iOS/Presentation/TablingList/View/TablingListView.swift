//
//  TablingListView.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import UIKit

import SnapKit

final class TablingListView: UIView {
    
    // MARK: - UI Components
    
    let completeCollectionView = CompleteCollectionView()
    private let cancelCollectionView = CancelCollectionView()
    
    private let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.selectedSegmentTintColor = .clear
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        for (index, title) in [I18N.TablingList.segementTitle1, I18N.TablingList.segementTitle2].enumerated() {
            segment.insertSegment(withTitle: title, at: index, animated: true)
            segment.setWidth(156, forSegmentAt: index)
        }
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.Gray100,
            .font: UIFont.pretendardSemiBold(size: 16)
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.Gray600,
            .font: UIFont.pretendardSemiBold(size: 16)
        ]
        segment.setTitleTextAttributes(normalAttributes, for: .normal)
        segment.setTitleTextAttributes(selectedAttributes, for: .selected)
        
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .Gray600
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let grayView: UIView = {
        let view = UIView()
        view.backgroundColor = .Gray000
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setAddTarget()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
private extension TablingListView {
    func setHierarchy() {
        addSubviews(segmentControl, grayView, underLineView, cancelCollectionView, completeCollectionView)
    }
    
    func setLayout() {
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(40)
        }
        
        grayView.snp.makeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom)
            $0.leading.equalTo(segmentControl.snp.leading).offset(30)
            $0.width.equalTo(92)
            $0.height.equalTo(2)
        }
        
        completeCollectionView.snp.makeConstraints {
            $0.top.equalTo(grayView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-17)
        }
        
        cancelCollectionView.snp.makeConstraints {
            $0.top.equalTo(grayView.snp.bottom).offset(12)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setAddTarget() {
        segmentControl.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        segmentControl.addTarget(self, action: #selector(changeSegmentedControlLinePosition(_:)), for: .valueChanged)
    }
    
    @objc
    func didChangeValue(_ segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            completeCollectionView.isHidden = false
            cancelCollectionView.isHidden = true
        case 1:
            completeCollectionView.isHidden = true
            cancelCollectionView.isHidden = false
        default:
            break
        }
    }
    
    @objc
    func changeSegmentedControlLinePosition(_ segment: UISegmentedControl) {
        let leadingDistance = Int(156 * CGFloat(segment.selectedSegmentIndex) + (156 - self.underLineView.bounds.width) * 0.5)
        UIView.animate(withDuration: 0.2, animations: {
            self.underLineView.snp.updateConstraints { $0.leading.equalTo(self.segmentControl.snp.leading).offset(leadingDistance) }
            self.layoutIfNeeded()
        })
    }
}
