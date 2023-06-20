//
//  GraphComponent.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 18/06/23.
//

import SwiftUI

struct GraphComponent: View {
    var body: some View {
        ZStack {
            Path { path in
                let width: CGFloat = 1732
                let height: CGFloat = 505.59
                let leadingInset: CGFloat = 94
                let topInset: CGFloat = 738

                let startPoint = CGPoint(x: leadingInset, y: topInset)
                let endPoint = CGPoint(x: leadingInset + width, y: topInset)
                let controlPoint1 = CGPoint(x: leadingInset + width * 0.25, y: topInset + height * 0.5)
                let controlPoint2 = CGPoint(x: leadingInset + width * 0.75, y: topInset + height * 0.5)

                path.move(to: startPoint)
                path.addCurve(to: endPoint, control1: controlPoint1, control2: controlPoint2)
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.red, .blue
//                        Color(red: 0.227, green: 0.204, blue: 0.251),
//                        Color(red: 0.141, green: 0.118, blue: 0.157)
                    ]),
                    startPoint: UnitPoint(x: 0.25, y: 0.5),
                    endPoint: UnitPoint(x: 0.75, y: 0.5)
                )
            )
        }
        .frame(width: 1732, height: 505.59)
//        .background(Color.white)
        .position(x: 1732/2, y: 505.59/2)
    }
}

struct GraphComponent_Previews: PreviewProvider {
    static var previews: some View {
        GraphComponent()
    }
}
