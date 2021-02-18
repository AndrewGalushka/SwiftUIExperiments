//
//  DeviceInfo.swift
//  SwiftUITests
//
//  Created by Andrii Halushka on 14.02.2021.
//

import UIKit

enum DeviceInfo {
    static func isTablet() -> Bool {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return true
        default:
            return false
        }
    }
}
