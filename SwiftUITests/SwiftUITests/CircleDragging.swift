//
//  CircleDragging.swift
//  SwiftUITests
//
//  Created by Andrii Halushka on 18.02.2021.
//

import SwiftUI

struct CircleDragging: View {
    // how far the circle has been dragged
    @State private var currentOffset = CGSize.zero
    @State private var offset = CGSize.zero
    
    // whether it is currently being dragged or not
    @State private var isDragging = false
    
    var body: some View {
        // a drag gesture that updates offset and isDragging as it moves around
        let dragGesture = DragGesture(minimumDistance: 0)
            .onChanged { value in self.currentOffset = value.translation }
            .onEnded { v in
                withAnimation {
                    self.offset = CGSize(width: offset.width + currentOffset.width,
                                         height: offset.height + currentOffset.height)
                    self.currentOffset = .zero
                    self.isDragging = false
                }
            }
        
        // a long press gesture that enables isDragging
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    self.isDragging = true
                }
            }
        
        // a combined gesture that forces the user to long press then drag
        let combined = pressGesture.sequenced(before: dragGesture)
        
        // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
        return VStack {
            ZStack {
                if isDragging {
                    Text("Now Drag!")
                        .padding()
                        .transition(.opacity)
                } else {
                    Text("Hold finger on the circle!")
                        .padding()
                        .transition(.opacity)
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color.orange.opacity(0.2))
            )
            
            Spacer()
            
            Circle()
                .fill(Color.red)
                .frame(width: 64, height: 64)
                .scaleEffect(isDragging ? 1.5 : 1)
                .offset(x: currentOffset.width + offset.width,
                        y: currentOffset.height + offset.height)
                .gesture(combined)
            
            Spacer()
        }
        .navigationBarTitle("", displayMode: .inline)
    }
    
    
    private struct Item: Identifiable {
        var id: String {
            "\(position)\(color)\(radius)"
        }
        
        var position: CGPoint
        var color: Color = .orange
        var radius: CGFloat = 10
    }
}

struct CircleDragging_Previews: PreviewProvider {
    static var previews: some View {
        CircleDragging()
    }
}
