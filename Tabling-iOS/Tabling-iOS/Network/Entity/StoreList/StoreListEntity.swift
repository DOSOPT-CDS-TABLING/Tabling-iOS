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

extension StoreListEntity {
    static func tablingListDummyData() -> [StoreListEntity] {
        return [
            StoreListEntity(shopID: 1, reviewCount: 64, averageWaiting: 4753, currentWaiting: 14, averageStar: 3.0, name: "파이브가이즈 여의도", shopCategory: "양식", shortAddress: "여의도동", profileImage: "https://github-production-user-asset-6210df.s3.amazonaws.com/67463603/284251896-4d2f58ad-11c6-466a-828a-bd4290e064e9.png"),
            StoreListEntity(shopID: 2, reviewCount: 64, averageWaiting:4753, currentWaiting: 14, averageStar: 4.0, name: "파이브가이즈 강남", shopCategory: "양식", shortAddress: "서초동", profileImage: "https://github-production-user-asset-6210df.s3.amazonaws.com/67463603/284251896-4d2f58ad-11c6-466a-828a-bd4290e064e9.png"),
            StoreListEntity(shopID: 3, reviewCount: 300, averageWaiting: 1083, currentWaiting: 14, averageStar: 2.0, name: "청화옥 방이점", shopCategory: "양식", shortAddress: "방이동", profileImage: "https://github-production-user-asset-6210df.s3.amazonaws.com/67463603/284251896-4d2f58ad-11c6-466a-828a-bd4290e064e9.png"),
            StoreListEntity(shopID: 4, reviewCount: 300, averageWaiting: 852, currentWaiting: 0, averageStar: 5.0, name: "청화옥 사당직영점", shopCategory: "양식", shortAddress: "사당동", profileImage: "https://github-production-user-asset-6210df.s3.amazonaws.com/67463603/284251896-4d2f58ad-11c6-466a-828a-bd4290e064e9.png"),
            StoreListEntity(shopID: 5, reviewCount: 300, averageWaiting: 773, currentWaiting: 1, averageStar: 4.0, name: "청화옥 양재점", shopCategory: "양식", shortAddress: "양재동", profileImage: "https://github-production-user-asset-6210df.s3.amazonaws.com/67463603/284251896-4d2f58ad-11c6-466a-828a-bd4290e064e9.png"),
            StoreListEntity(shopID: 6, reviewCount: 300, averageWaiting: 631, currentWaiting: 0, averageStar: 3.0, name: "아라네 부대찌개 여의도점", shopCategory: "양식", shortAddress: "여의도동", profileImage: "https://github-production-user-asset-6210df.s3.amazonaws.com/67463603/284251896-4d2f58ad-11c6-466a-828a-bd4290e064e9.png")
        ]
    }
}
