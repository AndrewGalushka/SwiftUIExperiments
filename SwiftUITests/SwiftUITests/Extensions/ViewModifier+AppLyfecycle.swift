//
//  ViewModifier+AppLyfecycle.swift
//  SwiftUITests
//
//  Created by Andrii Halushka on 14.02.2021.
//

import SwiftUI

extension View {
    func onAppEnterBackground(_ handler: @escaping () -> Void) -> some View {
        self.onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)) { _ in
            handler()
        }
    }
    
    func onAppBecomeActive(_ handler: @escaping () -> Void) -> some View {
        self.onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            handler()
        }
    }
}
