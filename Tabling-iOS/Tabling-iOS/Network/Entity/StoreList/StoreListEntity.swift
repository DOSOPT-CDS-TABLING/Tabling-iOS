//
//  StoreListEntity.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import Foundation

struct StoreListEntity: Codable {
    let shopID, reviewCount, averageWaiting, currentWaiting: Int
    let averageStar: Double
    let name, shopCategory, shortAddress, profileImage: String

    enum CodingKeys: String, CodingKey {
        case shopID = "shop_id"
        case averageStar = "average_star"
        case reviewCount = "review_count"
        case averageWaiting = "average_waiting"
        case currentWaiting = "current_waiting"
        case name = "name"
        case shopCategory = "shop_category"
        case shortAddress = "short_address"
        case profileImage = "profile_photo_url"
    }
}
