//
//  ContentView.swift
//  SwiftUITests
//
//  Created by Andrii Halushka on 21.12.2020.
//

import SwiftUI

struct AnimatedCircleView: View {
    var thickness: CGFloat = 40
    @State private var trim: ClosedRange<CGFloat> = 0...0
    @State private var color = AngularGradient(gradient: Gradient(colors: [Color.white, Color.black]), center: .center, startAngle: .zero, endAngle: .degrees(360))
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .ignoresSafeArea(.all)
            
            Circle()
                .trim(from: trim.lowerBound,
                      to: trim.upperBound)
                .stroke(color,
                    style: StrokeStyle(lineWidth: thickness, lineJoin: .round)
                )
                .frame(width: 300, height: 300)
        }
        .drawingGroup()
        .onAppear {
            withAnimation(Animation.easeOut(duration: 1).repeatForever()) {
                trim = 0...1.0
//                color = Color.red
            }
        }
    }
}

extension CGPoint: Identifiable {
    public var id: String {
        return "\(x)\(y)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedCircleView()
    }
}
