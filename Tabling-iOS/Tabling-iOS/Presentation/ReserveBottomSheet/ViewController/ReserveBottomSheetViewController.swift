//
//  ReserveBottomSheetViewController.swift
//  Tabling-iOS
//
//  Created by 민 on 11/22/23.
//

import UIKit

final class ReserveBottomSheetViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let reserveBottomSheetView = ReserveBottomSheetView()

    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPI()
        setUI()
        setHierarchy()
        setLayout()
        setDelegate()
    }
}

// MARK: - Extensions
extension ReserveBottomSheetViewController {
    func setUI() {
        
    }
    
    func setHierarchy() {
        
    }
    
    func setLayout() {
        
    }
    
    func setDelegate() {
        
    }
}

// MARK: - Network

extension ReserveBottomSheetViewController {
    func getAPI() {
        
    }
}

extension ReserveBottomSheetViewController {
    func tablingButtonClicked() {
        
    }
}
