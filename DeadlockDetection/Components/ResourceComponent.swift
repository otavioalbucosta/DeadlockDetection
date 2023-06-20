//
//  ResourceElement.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct ResourceComponent: View {
    var IDResource: String
    var body: some View {
        Circle().overlay {
            Text(IDResource)
                .foregroundColor(.black)
        }.foregroundColor(.blue)
    }
}

struct ResourceElement_Previews: PreviewProvider {
    static var previews: some View {
        ResourceComponent(IDResource: "AH MDS")
    }
}
