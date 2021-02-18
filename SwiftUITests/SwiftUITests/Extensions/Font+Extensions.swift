//
//  Font+Extensions.swift
//  SwiftUITests
//
//  Created by Andrii Halushka on 14.02.2021.
//

import SwiftUI

extension SwiftUI.Font {
    static func balooBhai(ofSize size: CGFloat) -> SwiftUI.Font {
        Font.system(size: size, weight: .bold, design: Design.rounded)
    }
}
