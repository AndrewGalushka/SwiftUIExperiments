//
//  AutoStartView.swift
//  SwiftUITests
//
//  Created by Andrii Halushka on 14.02.2021.
//

import SwiftUI

struct AutoStartView: View {
    var titleText: String = "NEXT LEVEL"
    
    var arcThickness: CGFloat = 43
    var railColor = Color(red: 0.13, green: 0.25, blue: 0.15)
    var progressColor = Color(red: 0, green: 1, blue: 0)
    var railBorderColor = Color(red: 0.13, green: 0.24, blue: 0.16)
    
    @SwiftUI.State private var currentTime: CGFloat = 4
    @SwiftUI.State private var progress: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.8)
                .ignoresSafeArea()
            
            VStack(spacing: DeviceInfo.isTablet() ? 40 : 80) {
                titleView()
                countDownCircle()
                cancelButton()
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 5).delay(3)) {
                progress = 0
                currentTime = 0
            }
        }
    }
    
    private func titleView() -> some View {
        Text(titleText)
            .font(
                .balooBhai(ofSize: DeviceInfo.isTablet() ? 90 : 52)
            )
            .foregroundColor(Color(red: 1.0, green: 1.0, blue: 0.15))
            .shadow(color: .red, radius: 0.5)
            .shadow(color: .red, radius: 0.5)
            .shadow(color: .red, radius: 0.5)
            .shadow(color: .red, radius: 0.5)
            .shadow(color: .red, radius: 0.5)
            .shadow(color: .red, radius: 0.5)
//            .shadow(color: .red, radius: 0.5)
            .frame(height: 100, alignment: .bottom)
    }
    
    private func cancelButton() -> some View {
        return Button(action: {
            print("Tapped")
        }, label: {
            Image("autostart.cancel.button")
                .resizable()
                .overlay(
                    GeometryReader { geo in
                        Text("CANCEL")
                            .foregroundColor(.white)
                            .font(
                                .balooBhai(ofSize: DeviceInfo.isTablet() ? 42 : 28)
                            )
                            .shadow(color: Color(red: 0.83, green: 0.49, blue: 0.15), radius: 1)
                            .position(x: geo.size.width / 2,
                                      y: geo.size.height * 0.44)
                    }
                )
        })
        .aspectRatio(2.83, contentMode: .fit)
        .frame(width: DeviceInfo.isTablet() ? 377 : 251)
    }
    
    private func countDownCircle() -> some View {
        let strokeWidth = arcThickness * 0.68
        let borderWidth = (arcThickness - strokeWidth) * 0.5
        
        return
            ZStack {
                // Outer border
                Circle()
                    .strokeBorder(railBorderColor, lineWidth: borderWidth)
                
                // Progress Rail
                Circle()
                    .strokeBorder(railColor, lineWidth: strokeWidth)
                    .padding(borderWidth)
                
                // Progress
                ArcShape.circle(startAngle: .degrees(270))
                    .trim(from: 0, to: progress)
                    .stroke(progressColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                    .padding(borderWidth + strokeWidth / 2)

                // Inner Border
                Circle()
                    .strokeBorder(railBorderColor, lineWidth: borderWidth)
                    .background(
                        Rectangle()
                            .modifier(ChangeOverTimeText(pct: currentTime, formatter: { "\(Int($0))" }))
                            .foregroundColor(.white)
                            .font(.balooBhai(ofSize: DeviceInfo.isTablet() ? 411 : 240))
                            .minimumScaleFactor(0.5)
                            .padding()
                    )
                    .padding(strokeWidth + borderWidth)
            }
            .aspectRatio(1, contentMode: .fit)
            .frame(maxWidth:  DeviceInfo.isTablet() ? 478 : 280)
    }
}

extension AutoStartView {
    struct ArcShape: Shape {
        let startAngle: Angle
        let endAngle: Angle
        let clockwise: Bool
        
        static func circle(startAngle: Angle = .degrees(0), clockwise: Bool = true) -> ArcShape {
            if clockwise {
                return ArcShape(startAngle: startAngle + .degrees(360), endAngle: startAngle, clockwise: clockwise)
            } else {
                return ArcShape(startAngle: startAngle, endAngle: startAngle + .degrees(360), clockwise: clockwise)
            }
        }
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                        radius: min(rect.width, rect.height) / 2,
                        startAngle: startAngle,
                        endAngle: endAngle,
                        clockwise: clockwise)
            return path
        }
    }
    
    struct ChangeOverTimeText: AnimatableModifier {
        var pct: CGFloat = 0
        var formatter: (CGFloat) -> String = {
            return "\($0)"
        }
        
        var animatableData: CGFloat {
            get { pct }
            set { pct = newValue }
        }
        
        func body(content: Content) -> Text {
            Text(formatter(pct))
        }
    }

}
#if DEBUG
struct AutoStartView_Previews: PreviewProvider {
    static var previews: some View {
        AutoStartView()
    }
}
#endif
