import SwiftUI


struct StartButtonStyle: ButtonStyle {
    var text: String
    var size: CGFloat?
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        RoundedRectangle(cornerRadius: 10)
            .stroke(style: StrokeStyle(lineWidth: 3.0)).fill(.black).offset(CGSize(width: 2.0, height: 2.0))
            .overlay(alignment: .center) {
                RoundedRectangle(cornerRadius: 10).fill(Color("YellowAccent"))
                    .overlay(alignment: .center) {
                        Text(text).font(.system(size: size ?? 24))
                    }
            }
    }
}
