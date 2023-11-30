//
//  URLConstant.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/25.
//

import Foundation

enum URLConstant {
    
    // MARK: - Base URL
    
    static let baseURL = Config.baseURL
    
    // MARK: - WaitingDetail
    
    static let waitingDetailURL = baseURL + "/orders"
    
    // MARK: - StoreDetail
    
    static let storeDetailURL = baseURL + "/shops"
    static let waitingStartURL = baseURL + "/orders/reserve"
    
    // MARK: - StoreList
    static let storeListURL = baseURL + "/shops"
    
    // MARK: - TablingList
    
    static let tablingURL = baseURL + "/orders"
    static let completeURL = baseURL + "/orders/complete"
}
