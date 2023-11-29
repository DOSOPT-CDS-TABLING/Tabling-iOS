//
//  WaitingDetailEntity.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import Foundation

struct WaitingDetailEntity: Codable {
    let orderID: Int
    let shopName: String
    let waitingNumber, beforeCount: Int
    let orderDate: String
    let personCount: Int
    let orderStatus: String
    let totalPrice: Int
    let requestContent: String

    enum CodingKeys: String, CodingKey {
        case orderID = "order_id"
        case shopName = "shop_name"
        case waitingNumber = "waiting_number"
        case beforeCount = "before_count"
        case orderDate = "order_date"
        case personCount = "person_count"
        case orderStatus = "order_status"
        case totalPrice = "total_price"
        case requestContent = "request_content"
    }
}
