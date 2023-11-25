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
        static let allMenuTitle = "전체 메뉴"
    }
    
    enum ReserveBottomSheet {
        static let personChoiceTitle = "방문 인원을 선택하세요"
        static let personTitle = "인원"
        static let tablingButtonTitle = "대기 신청하기"
    }
    
    enum StoreList {
        
    }
    
    enum TablingList {
        static let navigationBarTitle = "원격 줄서기 내역"
        static let segementTitle1 = "이용예정/완료"
        static let segementTitle2 = "취소/노쇼"
        static let statusPlanTitle = "이용예정"
        static let statusCompleteTitle = "이용완료"
        static let detailButtonTitle = "상세보기"
        static let testLabel = "test"
        static let beforeCountTitle = "현재 내 앞 대기"
        static let delayButtonTitle = "내 순서 미루기"
        static let confirmButtonTitle = "확정 코드 입력하기"
        static let cancelButtonTitle = "주문 취소"
        static let reviewButtonTitle = "리뷰쓰기"
    }
}
