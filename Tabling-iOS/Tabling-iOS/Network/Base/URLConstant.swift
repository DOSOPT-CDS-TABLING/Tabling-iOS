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
    
    
    // MARK: - StoreDetail
    
    
    // MARK: - StoreList
    static let storeListURL = baseURL + "/shops"
    
    // MARK: - TablingList
    
    static let tablingURL = baseURL + "/orders"
    static let completeURL = baseURL + "/orders/complete"
}
