//
//  TapGestureView.swift
//  SwiftUITests
//
//  Created by Andrii Halushka on 17.02.2021.
//

import SwiftUI
import UIKit

struct TapGestureView: UIViewRepresentable {
    var tapHandler: (_ location: CGPoint) -> Void
    
    func makeUIView(context: Context) -> UIView {
        let tapView = UIView()
        
        tapView.addGestureRecognizer(
            UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.tapGestureHandler(gesture:)))
        )
        
        return tapView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(tapHandler: tapHandler)
    }
    
    class Coordinator {
        let tapHandler: (_ location: CGPoint) -> Void
        
        init(tapHandler: @escaping (_ location: CGPoint) -> Void) {
            self.tapHandler = tapHandler
        }
        
        @objc
        func tapGestureHandler(gesture: UITapGestureRecognizer) {
            print("frame:\(gesture.view!.frame)")
            print("loc:\(gesture.location(in: gesture.view))")
            tapHandler(gesture.location(in: gesture.view))
        }
    }
}
