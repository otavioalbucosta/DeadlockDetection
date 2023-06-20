//
//  ProcessElement.swift
//  DeadlockDetection
//
//  Created by Luciana Adrião on 20/06/23.
//

import SwiftUI

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.black) // Change the text color here
            .padding()
            .background(Color("YellowAccent"))
            .cornerRadius(8)
    }
}

struct ProcessElement: View {
    var IDProcess: String
    var body: some View {
        RoundedRectangle(cornerRadius: 20).overlay {
            Text(IDProcess)
                .foregroundColor(.black)
        }.foregroundColor(.gray)
    }
}

struct ProcessElement_Previews: PreviewProvider {
    static var previews: some View {
        ProcessElement(IDProcess: "HAHAHAHAHA")
    }
}

