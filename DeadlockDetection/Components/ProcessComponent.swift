//
//  ProcessElement.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct ProcessComponent: View {
    var IDProcess: String
    var status: Bool
    
    @State var position: CGPoint

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 20).fill(status ? .gray : Color.randomColor())
                    .overlay {
                        VStack(alignment: .leading) {
                            Text(IDProcess)
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
                    }
                ProcessStatusComponent(locked: status)
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

        )
    }
}

struct ProcessElement_Previews: PreviewProvider {
    static var previews: some View {
        ProcessComponent(IDProcess: "HAHAHAHAHA", status: true, position: CGPoint(x: 200, y: 200))
    }
}

