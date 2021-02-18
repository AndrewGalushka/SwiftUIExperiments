//
//  DynamicAddableContentView.swift
//  SwiftUITests
//
//  Created by Andrii Halushka on 17.02.2021.
//

import SwiftUI

struct DynamicAddableContentView: View {
    @State private var items = [Item]()
    
    var body: some View {
        ZStack {
            Color.white.opacity(1).ignoresSafeArea(.all)
            
            TapGestureView(tapHandler: { (tapLocation) in
                items.append(
                    Item(position: tapLocation, color: .random, shapeType: .random)
                )
            })
            .overlay(
                ZStack {
                    ForEach(items) { item in
                        if let radius = item.shapeType.asCircle() {
                            Circle()
                                .frame(width: radius * 2)
                                .position(item.position)
                                .foregroundColor(item.color)
                                .shadow(color: Color.black.opacity(0.5), radius: 2, x: 2, y: 2)
                        } else if let width = item.shapeType.asRoundedRectangle() {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: width, height: width * 3)
                                .position(item.position)
                                .foregroundColor(item.color)
                                .shadow(color: Color.black.opacity(0.5), radius: 2, x: 2, y: 2)
                        }
                    }
                }
                .border(Color.orange.opacity(0.2), width: 1)
            )
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private struct Item: Identifiable {
        var id: String {
            "\(position)\(color)\(shapeType)"
        }
        
        var position: CGPoint
        var color: Color = .orange
        var shapeType: ShapeType
        
        enum ShapeType {
            case circle(radius: CGFloat = 10)
            case roundedRectangle(width: CGFloat = 50)
            
            func asCircle() -> CGFloat? {
                switch self {
                case .circle(let radius):
                    return radius
                default:
                    return nil
                }
            }

            func asRoundedRectangle() -> CGFloat? {
                switch self {
                case .roundedRectangle(let width):
                    return width
                default:
                    return nil
                }
            }
            
            static var random: ShapeType {
                switch Int.random(in: 0...1) {
                case 0:
                    return .circle()
                case 1:
                    return .roundedRectangle()
                default:
                    fatalError()
                }
            }
        }
    }
}

struct DynamicAddableContentView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicAddableContentView()
    }
}
