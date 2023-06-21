//
//  ProcessStatusComponent.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct ProcessStatusComponent: View {
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .stroke(lineWidth: 1.0).shadow(radius: 3.0).foregroundColor(.white)
                .overlay {
                    Circle().fill(.gray).overlay {
                        Image(systemName: "lock")
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
        ProcessStatusComponent()
    }
}
