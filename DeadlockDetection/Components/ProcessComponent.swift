//
//  ProcessElement.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct ProcessComponent: View {
    @StateObject var process: Process
    
    @State var position: CGPoint
    

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 20).fill(process.isSleeping ? .gray : Color.randomColor())
                    .overlay {
                        VStack(alignment: .leading) {
                            Text(process.id.description.prefix(5))
                                .foregroundColor(.black)
                                .font(.system(size: 18))
                                .truncationMode(.tail)

                            Text("Status do processo")
                                .foregroundColor(.black)
                                .font(.system(size: 8))

                            Spacer()

                            HStack {
                                Text("tempo de espera ")
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 8))
                                
                                Spacer()
                                Text("12 s")
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15)).bold()
                            }
                        }
                        .frame(width: geometry.size.width*0.9)
                        .padding(.all)
                        .foregroundColor(.black)
                        
                        ForEach(process.next, id: \.id){ graph in
                            Path { path in
                                path.move(to: process.position)
                                path.addLine(to: graph.position)
                                print(path.currentPoint)
                            }
                            .offsetBy(dx: geometry.size.width*0.45, dy: 0)
                            .stroke(lineWidth: 4)
                        }
                    }
                ProcessStatusComponent(locked: process.isSleeping)
                        .frame(width: geometry.size.width*0.35,
                               height: geometry.size.width*0.35)
                        .position(CGPoint(x: geometry.size.width*0.9,
                                          y: geometry.size.height*0.1 ))
            }
            
        }
            .position(self.position)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        self.position = value.location
                        print(self.position)
                    })
                    .onEnded({ value in
                        self.process.position = value.location
                    })
    
            )
    }
}

struct ProcessElement_Previews: PreviewProvider {
    static var previews: some View {
        ProcessComponent(process: Process(askResourceTimeSpan: 5, useResourceTimeSpan: 5),position: CGPoint(x: 200, y: 200) )
    }
}

