//
//  InputView.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct InputView: View {
    @State private var osTimerSet: String = ""
    @State var selectedResource: Int = 0
    private var maxResources: Int = 10

    var body: some View {
        VStack(alignment: .center) {
                Text("Preferências de simulação").font(.title).bold()

            Spacer()

            RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1.0).fill(.white.opacity(0.5)).overlay {
                VStack {
                    HStack {
                        Text("Tempo para o sistema operacional")
                        Text("padrão é \(maxResources)").font(.footnote).italic()
                        Spacer()
                        TextField(
                            "Insira aqui",
                            text: $osTimerSet
                        ).frame(width: 120)
                    }

                    Divider().foregroundColor(.white)

                    HStack {
                        Text("Quantidade de recursos")
                        Text("max. \(maxResources)").font(.footnote).italic()
                        Spacer()
                        Picker("", selection: $selectedResource) {
                            Text("1").tag(1)
                            Text("2").tag(2)
                            Text("3").tag(3)
                            Text("4").tag(4)
                            Text("5").tag(5)
                            Text("6").tag(6)
                            Text("7").tag(7)
                            Text("8").tag(8)
                            Text("9").tag(9)
                            Text("10").tag(10)
                        }.pickerStyle(.menu).frame(width: 120)
                    }
                }.padding()
            }.padding()

            NavigationLink("") {
                setResource(selectedResource: $selectedResource)
                    .frame(width: 660, height: 464)

            }.buttonStyle(StartButtonStyle(text: "Next", size: 18)).foregroundColor(.black).frame(width: 92, height: 48)
                .simultaneousGesture(TapGesture().onEnded({ _ in
                    OperationalSystem.shared.setTimeInterval(time: Int(osTimerSet) ?? 10)
                    for _ in 0..<selectedResource {
                        OperationalSystem.shared.resourceFactory()
                    }
                }))
        }.background(Color("DullPurple")).foregroundColor(.white)
    }

    func checkTerms() {
        if osTimerSet.isEmpty != true && selectedResource != 0 {
            // TODO: change View
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
