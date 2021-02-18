//
//  Color+Random.swift
//  SwiftUITests
//
//  Created by Andrii Halushka on 18.02.2021.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
    
    static func hex(_ hexString: String, opacity: Double = 1) -> Color {
        let start: String.Index
        
        if let index = hexString.firstIndex(of: "#") {
            start = hexString.index(after: index)
        } else {
            start = hexString.startIndex
        }
        
        let hexString = hexString[start...]
        
        var scanResult: UInt64 = 0
        Scanner(string: String(hexString)).scanHexInt64(&scanResult)
        
        return Color(red: Double((scanResult >> 16) & 0xFF) / 255,
                     green: Double((scanResult >> 8) & 0xFF) / 255,
                     blue: Double(scanResult & 0xFF) / 255,
                     opacity: opacity)
    }
}
