//
//  CurvedLine.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 20/06/23.
//

import SwiftUI

struct CurvedLine: Shape {
    let from: CGPoint
    let to: CGPoint
    var control: CGPoint
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
            AnimatablePair(control.x, control.y)
        }
        set {
            control = CGPoint(x: newValue.first, y: newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: from)
        path.addQuadCurve(to: to, control: control)
        
        let angle = atan2(to.y - control.y, to.x - control.x)
        let arrowLength: CGFloat = 15
        let arrowPoint1 = CGPoint(x: to.x - arrowLength * cos(angle - .pi / 6), y: to.y - arrowLength * sin(angle - .pi / 6))
        let arrowPoint2 = CGPoint(x: to.x - arrowLength * cos(angle + .pi / 6), y: to.y - arrowLength * sin(angle + .pi / 6))
        
        path.move(to: to)
        path.addLine(to: arrowPoint1)
        path.move(to: to)
        path.addLine(to: arrowPoint2)
        
        return path
    }
}

struct CurvedLine_Previews: PreviewProvider {
    static var previews: some View {
        CurvedLine()
    }
}
