//
//  GraphComponent.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 18/06/23.
//

import SwiftUI

struct GraphComponent: View {
    @State var graphID: UUID
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GraphComponent_Previews: PreviewProvider {
    static var previews: some View {
        GraphComponent(graphID: UUID())
    }
}
