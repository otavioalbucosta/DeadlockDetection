//
//  DeadlockDetectionApp.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 06/06/23.
//

import SwiftUI

@main
struct DeadlockDetectionApp: App {
    @State var useAlert = true
    @State var quantity: Int = 0
    var body: some Scene {
        WindowGroup {
            GraphView()
            #if os(iOS)
                .alert("Insira o tempo de checagem de deadlock do OS", isPresented: $useAlert) {
                    TextField("Insira aqui", value: $quantity, formatter: NumberFormatter())
                    Button("Ok") {
                        submit(quantity: quantity)
                    }
                    .buttonStyle(.automatic)

                }
            #endif

            #if os(macOS)


            #endif
        }
    }
    func submit(quantity: Int) {
        OperationalSystem.shared.setTimeInterval(time: quantity)
    }
    
}
