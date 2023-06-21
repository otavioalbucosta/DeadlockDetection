//
//  setResource.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct setResource: View {
    @State private var resourceName: String = ""
    @State private var osTimerSet: String = ""
    @State private var selectedResource: Int = 0
    private var ID: UUID = UUID()
    private var maxResources: Int = 10
    private var goToGraphs: Bool = false


    var body: some View {
        VStack(alignment: .center) {
            Text("Informações do recurso")

            Spacer()

            HStack {
                Text("Identificador").foregroundColor(.white).opacity(0.5)
                Spacer()
                Text(ID.description.prefix(5)).foregroundColor(.white).opacity(0.5)
            }.padding(.horizontal)

            RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1.0).fill(.white.opacity(0.5)).overlay {
                VStack {
                        TextField(
                            "Nome do recurso",
                            text: $resourceName
                        ).textFieldStyle(.roundedBorder)

                    Divider().foregroundColor(.white)

                    HStack {
                        Text("Tempo da thread")
                        Spacer()
                        Picker("", selection: $selectedResource) {
                            Text("1").tag(1)
                            Text("2").tag(2)
                            Text("3").tag(3)
                        }.pickerStyle(.menu).frame(width: 120)
                    }
                }.padding()
            }.padding()

            HStack {
                NavigationLink("") {
                    //
                }.buttonStyle(StartButtonStyle(text: "Back", size: 18)).foregroundColor(.black).frame(width: 92, height: 48)

                Spacer()

                NavigationLink("") {
                    //
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

struct setResource_Previews: PreviewProvider {
    static var previews: some View {
        setResource()
    }
}
