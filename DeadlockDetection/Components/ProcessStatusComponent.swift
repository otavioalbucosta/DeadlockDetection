//
//  ProcessStatusComponent.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct ProcessStatusComponent: View {
    var locked: Bool
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .stroke(lineWidth: 1.0)
                .foregroundColor(.white)
                .overlay {
                    Circle().fill(.ultraThinMaterial).shadow(color: .black, radius: 4, x: -2, y: 2).overlay {
                        Image(systemName: locked ? "lock.fill" : "lock.open.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width*0.5, height: geometry.size.height*0.5)
                    }
                }
        }
    }
}

struct ProcessStatusComponent_Previews: PreviewProvider {
    static var previews: some View {
        ProcessStatusComponent(locked: true)
    }
}
