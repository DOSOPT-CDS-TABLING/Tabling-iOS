//
//  StringLiterals.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/18.
//

import Foundation

enum I18N {
    
    enum WaitingDetail {
        static let nextButtonTitle = "다음으로"
    }
    
    enum ReserveAlert {
        static let reserveTitle = "대기 신청 완료"
        static let waitingTitle = "대기번호"
        static let waitingNumTitle = "번"
        static let shopTitle = "매장명"
        static let personTitle = "인원"
        static let statusTitle = "신청상태"
        static let reserveButtonTitle = "대기 내역 확인하기"
    }
    
    enum StoreDetail {
        static let lookMapButtonTitle = "지도보기"
        static let homeSegmentControlTitle = "홈"
        static let menuSegmentControlTitle = "전체메뉴"
        static let reviewSegmentControlTitle = "최근리뷰"
        static let tablingButtonTitle = "원격줄서기"
        static let reservationButtonTitle = "예약 불가"
        static let orederButtonTitle = "주문 불가"
    }
    
    enum StoreList {
        
    }
    
    enum TablingList {
        static let navigationBarTitle = "원격 줄서기 내역"
        static let segementTitle1 = "이용예정/완료"
        static let segementTitle2 = "취소/노쇼"
    }
}
