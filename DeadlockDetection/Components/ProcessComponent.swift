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

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 20).fill(Color.randomColor())
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
                if status {
                    ProcessStatusComponent().frame(width: geometry.size.width*0.25, height: geometry.size.width*0.25)
                }
            }
        }

    }
}

struct ProcessElement_Previews: PreviewProvider {
    static var previews: some View {
        ProcessComponent(IDProcess: "HAHAHAHAHA", status: true)
    }
}

