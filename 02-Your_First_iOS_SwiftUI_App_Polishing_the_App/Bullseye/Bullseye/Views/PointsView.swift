//
//  PointsView.swift
//  Bullseye
//
//  Created by Anne Freitas on 01/02/24.
//

import SwiftUI

struct PointsView: View {
    var body: some View {
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is")
            BigNumberText(text: "89")
            BodyText(text: "You score 200 Points\n 😻😻😻")
            Button {
                // start new round
            } label: {
                ButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

#Preview("Portrait") {
    PointsView()
}


#Preview("LandscapeRight") {
    PointsView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        .previewInterfaceOrientation(.landscapeRight)
}
