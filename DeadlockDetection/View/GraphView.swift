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
                        GeometryReader{ proxy in
                            RoundedRectangle(cornerRadius: 15).fill(Color("DarkerPurple")).overlay {
                                ZStack {
                                    
                                    ForEach(OS.processes) { process in
                                        ProcessComponent(process: process, position: CGPoint(x: 0 , y: 0))
                                            .frame(width: geometry.size.width*0.09,
                                                   height: geometry.size.height*0.15)
                                        
                                        
                                        
                                    }
                                    
                                    
                                    ForEach(OS.resources) { resource in
                                        ResourceComponent(resource: resource, position: CGPoint(x: 200, y: 200))
                                            .frame(width: geometry.size.width*0.09,
                                                   height: geometry.size.height*0.15)
                                    }
                                }
                            }
                            
                        }
                        
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                Group {
                                    Text("Tempo do sistema: \(OS.timeRemaining)")
                                    Text("Deadlock Detectado: \(OS.deadlockFound.description)")
                                }.font(.body).padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                            }.background(Color("DarkerPurple"))

                            Spacer()

                            Button {
                                OS.processFactory(askTime: 4, useTime: 5)
                            } label: {
                            }
                            .buttonStyle(StartButtonStyle(text: "Novo Processo", size: 24))
                            .frame(width: geometry.size.width*0.14,
                                   height:geometry.size.width*0.06)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            Button {
                                OS.resourceFactory(name: "Impressora")
                            } label: {
                            }
                            .buttonStyle(StartButtonStyle(text: "Novo Recurso", size: 24))
                            .frame(width: geometry.size.width*0.14,
                                   height:geometry.size.width*0.06)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            Button {
                                OS.resourceFactory(name: "Impressora")
                            } label: {
                            }
                            .buttonStyle(StartButtonStyle(text: "Novo Recurso", size: 24))
                            .frame(width: geometry.size.width*0.14,
                                   height:geometry.size.width*0.06)
                            .foregroundColor(.black)


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
