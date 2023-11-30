//
//  ReserveEntity.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/21.
//

import Foundation

struct ReserveEntity: Codable {
    let orderID, waitingNumber, beforeCount: Int
    let shopName: String
    let personCount: Int
    let orderStatus: String
    
    enum CodingKeys: String, CodingKey {
        case orderID = "order_id"
        case waitingNumber = "waiting_number"
        case beforeCount = "before_count"
        case shopName = "shop_name"
        case personCount = "person_count"
        case orderStatus = "order_status"
    }
}
