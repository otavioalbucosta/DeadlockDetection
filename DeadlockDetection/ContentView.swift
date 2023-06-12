//
//  ContentView.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 06/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var OS = OperationalSystem.shared
    var body: some View {
        VStack {
            List {
                ForEach(OS.resources) { resouce in
                    Text(resouce.name)
                }
                .onDelete { index in
                    OS.resources.remove(atOffsets: index)
                }
            }
            Button {
                OS.resourceFactory(name: "Impressora")
            } label: {
                Text("Criar Resource")
                    
            }
            .buttonStyle(.bordered)
            List {
                ForEach(OS.processes) { process in
                    Text(process.id.description)
                }
                .onDelete { index in
                    OS.processes.remove(atOffsets: index)
                }
            }
            Button {
                OS.processFactory(askTime: 5, useTime: 5)
            } label: {
                Text("Criar Processo")
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
