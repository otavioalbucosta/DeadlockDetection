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
                    VStack {
                        Text(resouce.id.description.prefix(5))
                        Text(resouce.beingRequestedBy.map({$0.id.description.prefix(5)}).description)
                    }
                }
                .onDelete { index in
                    OS.resources.remove(atOffsets: index)
                }
            }
            Button {
                OS.resourceFactory()
            } label: {
                Text("Criar Resource")
                    
            }
            .buttonStyle(.bordered)
            List {
                ForEach(OS.processes) { process in
                    VStack{
                        Text(process.id.description.prefix(5))
                        ForEach(process.currentResources.map({$0.resource.id}), id: \.self) { resource in
                            Text(resource.description.prefix(5))
                        }
                        Text(process.requestedResource?.id.description.prefix(5) ?? "nil")
                    }

                    
                }
                .onDelete { index in
                    OS.processes.remove(atOffsets: index)
                }
            }
            Button {
                OS.processFactory(askTime: 1, useTime: 5)
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
