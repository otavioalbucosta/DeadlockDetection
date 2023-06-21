//
//  FirstView.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 19/06/23.
//

import SwiftUI

struct FirstView: View {

    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State private var opacityLevel = 1.0
    @State var changedView = false

    var body: some View {

        GeometryReader { geometry in
            NavigationStack {
                ZStack(alignment: .bottom) {
                    Image("UnionBackground")
                        .resizable().aspectRatio(contentMode: .fit)
                        .frame(alignment: .bottom)

                    VStack {
                        Spacer()
                        Text("Deadlock Detection")
                            .font(.title).bold().foregroundColor(.white)

                        Spacer()

                        ZStack {
                            Image("Deadlock-1").resizable().aspectRatio(contentMode: .fit)
                            Image("Deadlock-2").resizable().aspectRatio(contentMode: .fit).opacity(opacityLevel)
                        }.frame(width: geometry.size.width*0.6)
                        .onReceive(timer) { _ in
                            opacityLevel = opacityLevel == 1 ? 0.1 : 1
                        }

                        Spacer()

                        NavigationLink {
                            #if os(macOS)
                            InputView().frame(width: geometry.size.width*0.45, height: geometry.size.height*0.35)
                            #elseif os(iOS)
                            GraphView()
                            #endif
                        } label: {
                            
                        }   .buttonStyle(StartButtonStyle(text: "Começar")).foregroundColor(.black)
                            .frame(minWidth: 180, idealWidth: 209, maxWidth: 209, minHeight: 40, idealHeight: 68, maxHeight: 68)
                            .padding(.bottom)

                        Spacer()

                    }
                }
                .background(Color("DullPurple"))
                .ignoresSafeArea(.all, edges: [.bottom,.horizontal])
                .frame(width: geometry.size.width, height: geometry.size.height)
            }

        }.background(Color("DullPurple"))
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
