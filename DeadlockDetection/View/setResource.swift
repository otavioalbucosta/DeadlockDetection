//
//  setResource.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct setResource: View {
    @State  var resourceName: String = ""
    @State  var osTimerSet: String = ""
    @Binding var selectedResource: Int
     var ID: UUID = UUID()
     var maxResources: Int = 10
     var goToGraphs: Bool = false

    @StateObject var OS = OperationalSystem.shared

    var body: some View {
        VStack(alignment: .center) {
            Text("Informações do recurso")

            Spacer()


            RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1.0).fill(.white.opacity(0.5)).overlay {
                ScrollView {
                    VStack {
                        ForEach(OS.resources.indices) { index in
                            HStack {
                                Text("Identificador").foregroundColor(.white).opacity(0.5)
                                Spacer()
                                Text(OS.resources[index].id.description.prefix(5)).foregroundColor(.white).opacity(0.5)
                            }.padding(.horizontal)

                            TextField(
                                "Nome do recurso",
                                text: $OS.resources[index].name
                            ).textFieldStyle(.roundedBorder)

                            Divider().foregroundColor(.white)

                        }
                    }.padding()
                }
            }.padding()

            HStack {

                Spacer()

                NavigationLink("") {
                    GraphView()
                }.buttonStyle(StartButtonStyle(text: "Next", size: 18)).foregroundColor(.black).frame(width: 92, height: 48)
            }.padding()
        }.background(Color("DullPurple")).foregroundColor(.white)
    }

    func checkTerms() {
        if osTimerSet.isEmpty != true && selectedResource != 0 {
            // TODO: change View

        }
    }
}
