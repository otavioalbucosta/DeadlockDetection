//
//  GraphVIew.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct GraphVIew: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Deadlock Detection").font(.title).bold()
                HStack {
                    VStack {
                        RoundedRectangle(cornerRadius: 15).fill(Color("DarkerPurple"))
                        HStack(alignment: .center) {
                            VStack {
                                Group {
                                    Text("Tempo do sistema:               ")
                                    Text("Ocorreu deadlock:               ")
                                }.font(.body)
                            }.background(Color("DarkerPurple"))
                            Button("Novo processo") {
                                //
                            }.buttonStyle(CustomButton())
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
        GraphVIew()
    }
}
