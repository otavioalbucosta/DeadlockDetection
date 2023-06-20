//
//  ProcessElement.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct ProcessComponent: View {
    var IDProcess: String

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .overlay {
                VStack(alignment: .leading) {
                    Text(IDProcess)
                        .foregroundColor(.black)
                        .font(.system(size: 18))

                    Text("Status do processo")
                        .foregroundColor(.black)
                        .font(.system(size: 9))
                    Spacer()

                    HStack {
                        Text("tempo de espera ")
                        Spacer()
                        Text("x segundos")
                    }

                }
                .padding()
                .foregroundColor(.black)
                .background(.blue.opacity(0.2))

                //                Circle()
                //                    .overlay {
                //                        Image(systemName: "lock.circle").foregroundColor(.black)
                //                    }
                //                    .frame(maxWidth: geo.size.width*0.25)
            }
    }
}

struct ProcessElement_Previews: PreviewProvider {
    static var previews: some View {
        ProcessComponent(IDProcess: "HAHAHAHAHA")
    }
}

