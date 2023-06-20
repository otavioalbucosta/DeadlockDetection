//
//  FirstView.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 19/06/23.
//

import SwiftUI

struct FirstView: View {

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var opacityLevel = 1.0

    var body: some View {

            VStack {
                Text("aaaaaaa")
                Image("Deadlock-1").scaledToFill()
                StartButtonView()
            }.background(.red)
//        VStack {
//            Text("Deadlock Detection").font(.title).bold()
//            ZStack {
//                Image("Deadlock-1").resizable().scaledToFit().padding(.all)
//                Image("Deadlock-2").resizable().scaledToFit().padding(.all).opacity(opacityLevel)
//
//            }
//            .onReceive(timer) { _ in
//                opacityLevel = opacityLevel == 1 ? 0.1 : 1
//            }
//
//            VStack {
//                StartButtonView()
//                    .frame(width: 300, height: 100)
//
//            }
//            Spacer()
//        }
//        .frame(width:.infinity, height: .infinity)
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
