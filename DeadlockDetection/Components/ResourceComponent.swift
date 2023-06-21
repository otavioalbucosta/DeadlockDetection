//
//  ResourceElement.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct ResourceComponent: View {
    @StateObject var resource: Resource
    @State var position: CGPoint = CGPoint(x: 200, y: 200)
    var body: some View {
        GeometryReader{ geo in
            Circle().overlay {
                Text(resource.id.description.prefix(5))
                    .foregroundColor(.black)
                
                
            }
            .foregroundColor(.blue)
            .position(self.position)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        self.position = value.location
                        print("Location: ", value.location)
                    })
                    .onEnded({ value in
                        self.resource.position = value.location
                    })
                
            )
            
//            ForEach(resource.next, id: \.id){ graph in
//                CurvedLine(from: self.position, to: graph.position, control: CGPoint(x: self.position.x + graph.position.x, y: graph.position.y + self.position.y))
//                    .stroke(lineWidth: 4)
//            }
            
        }
    }
}

struct ResourceElement_Previews: PreviewProvider {
    static var previews: some View {
        ResourceComponent( resource: Resource(name: "Impressora"))
    }
}
