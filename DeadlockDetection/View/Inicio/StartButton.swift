import SwiftUI

struct StartButtonView: View {
    var body: some View {
        Rectangle()
//            .frame(width: 460, height: 160)
            .foregroundColor(.blue)
            .background(Color("YellowAccent"))
            .overlay(
                Text("Hello, AH!")
//                    .frame(width: 460, height: 160)
                    .background(Color.red)
            )
//            .padding(.top, 657)
//            .padding(.horizontal)
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
    }
}
