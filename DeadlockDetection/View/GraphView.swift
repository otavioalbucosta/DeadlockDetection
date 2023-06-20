//
//  GraphVIew.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct GraphView: View {
    @StateObject var OS = OperationalSystem.shared

    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Deadlock Detection").font(.title).bold()
                HStack {
                    VStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 15).fill(Color("DarkerPurple")).overlay {
                            VStack {
                                ForEach(OS.processes) { process in
                                    ProcessComponent(IDProcess: process.id.description)
                                }
                            }
                        }
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                Group {
                                    Text("Tempo do sistema: \(OS.timeRemaining)")
                                    Text("Ocorreu deadlock: \(OS.deadlockFound.description)")
                                }.font(.body)
                            }.background(Color("DarkerPurple"))
                            Button {
                                OS.processFactory(askTime: 1, useTime: 5)
                            } label: {
                            }
                            .buttonStyle(StartButtonStyle(text: "Novo Processo", size: 24))
                            .frame(width: geometry.size.width*0.14,
                                   height:geometry.size.width*0.06)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            Spacer()

                        }
                    }
                    RoundedRectangle(cornerRadius: 15).fill(Color("DarkerPurple"))
                        .frame(width: geometry.size.width*0.16).padding([.leading, .trailing])
                }.padding()
            }.background(Color("DullPurple"))
        }
    }
}

struct GraphVIew_Previews: PreviewProvider {

    static var previews: some View {
        GraphView()
    }
}
