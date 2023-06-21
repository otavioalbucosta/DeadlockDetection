//
//  setProcess.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct setProcess: View {
    @State  var osTimerSet: String = ""
     var ID: UUID = UUID()

    @StateObject var OS = OperationalSystem.shared

    var body: some View {
        VStack(alignment: .center) {
            Text("Informações do recurso")

            Spacer()


            RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1.0).fill(.white.opacity(0.5)).overlay {
                ScrollView {
                    VStack {
                        ForEach(OS.processes.indices) { index in
                            HStack {
                                Text("Identificador").foregroundColor(.white).opacity(0.5)
                                Spacer()
                                Text(OS.processes[index].id.description.prefix(5)).foregroundColor(.white).opacity(0.5)
                            }.padding(.horizontal)

                            TextField("Tempo de requisição do processo", value: $OS.processes[index].askResourceTimeSpan, formatter: NumberFormatter())
                                
                            TextField("Tempo de requisição do processo", value: $OS.processes[index].useResourceTimeSpan, formatter: NumberFormatter())

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


}
