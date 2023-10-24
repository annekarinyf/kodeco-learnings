//
//  ContentView.swift
//  Bullseye
//
//  Created by Anne Freitas on 25/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                Text("🎯🎯🎯\nPut the Bullseye as close as you can to".uppercased())
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                    .kerning(2.0)
                    .padding(.horizontal, 30)
                    .foregroundColor(Color("TextColor"))
                Text(String(game.target))
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .kerning(-1.0)
                    .foregroundColor(Color("TextColor"))
                HStack {
                    Text("1")
                        .bold()
                        .font(.body)
                        .foregroundColor(Color("TextColor"))
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .bold()
                        .font(.body)
                        .foregroundColor(Color("TextColor"))
                }
                .padding(.all)
                Button("Hit me".uppercased()) {
                    alertIsVisible = true
                }
                .padding(20)
                .background(
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(
                            colors: [Color.white.opacity(0.3),Color.clear],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    }
                )
                .foregroundColor(.white)
                .cornerRadius(21)
                .bold()
                .font(.title3)
                .alert(isPresented: $alertIsVisible) {
                    return Alert(
                        title: Text("Hello there"),
                        message: Text("The slider's value is \(Int(sliderValue.rounded())). You scored \(game.points(sliderValue: Int(sliderValue))) this round."),
                        dismissButton: .default(Text("Awesome"))
                    )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
