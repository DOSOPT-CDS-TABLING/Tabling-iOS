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
    
    private let completeCollectionView = CompleteCollectionView()
    private let cancelCollectionView = CancelCollectionView()
    
    private let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.selectedSegmentTintColor = .clear
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        segment.insertSegment(withTitle: I18N.TablingList.segementTitle1, at: 0, animated: true)
        segment.insertSegment(withTitle: I18N.TablingList.segementTitle2, at: 1, animated: true)
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.Gray100,
            NSAttributedString.Key.font: UIFont.pretendardSemiBold(size: 16)
        ], for: .normal)
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.Gray600,
            NSAttributedString.Key.font: UIFont.pretendardSemiBold(size: 16)
        ], for: .selected)
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
        
//        setUI()
        setHierarchy()
        setLayout()
        setAddTarget()
//        setRegisterCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TablingListView {
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
            $0.top.equalTo(grayView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        cancelCollectionView.snp.makeConstraints {
            $0.top.equalTo(grayView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setAddTarget() {
        segmentControl.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        segmentControl.addTarget(self, action: #selector(changeSegmentedControlLinePosition(_:)), for: .valueChanged)
    }
    
    @objc
    private func didChangeValue(_ segment: UISegmentedControl) {
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
    private func changeSegmentedControlLinePosition(_ segment: UISegmentedControl) {
        lazy var leadingDistance = 30
        switch segment.selectedSegmentIndex {
        case 0:
            leadingDistance = 30
        case 1:
            leadingDistance = 190
        default:
            print("0")
        }
        UIView.animate(withDuration: 0.2, animations: {
            self.underLineView.snp.updateConstraints { $0.leading.equalTo(self.segmentControl.snp.leading).offset(leadingDistance) }
            self.layoutIfNeeded()
        })
    }
}
