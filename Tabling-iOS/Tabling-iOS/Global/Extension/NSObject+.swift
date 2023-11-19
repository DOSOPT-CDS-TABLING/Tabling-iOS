//
//  NSObject+.swift
//  Tabling-iOS
//
//  Created by 고아라 on 2023/11/17.
//

import Foundation

extension NSObject {
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
}
