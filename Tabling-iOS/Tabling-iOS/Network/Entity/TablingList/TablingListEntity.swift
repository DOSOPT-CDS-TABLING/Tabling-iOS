//
//  TablingListEntity.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/22.
//

import Foundation

struct TablingListEntity: Codable {
    let orderID: Int
    let orderStatus: String
    let shopID: Int
    let shopName, orderDate: String
    let personCount, waitingNumber, beforeCount, remainingReviewPeriod: Int

    enum CodingKeys: String, CodingKey {
        case orderID = "order_id"
        case orderStatus = "order_status"
        case shopID = "shop_id"
        case shopName = "shop_name"
        case orderDate = "order_date"
        case personCount = "person_count"
        case waitingNumber = "waiting_number"
        case beforeCount = "before_count"
        case remainingReviewPeriod = "remaining_review_period"
    }
}
