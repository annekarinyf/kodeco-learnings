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
        VStack {
            Text("🎯🎯🎯\nPut the Bullseye as close as you can to".uppercased())
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
                .kerning(2.0)
                .padding(.horizontal, 30)
            Text(String(game.target))
                .font(.largeTitle)
                .fontWeight(.black)
                .kerning(-1.0)
            HStack {
                Text("1")
                    .bold()
                    .font(.body)
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
                    .font(.body)
            }
            .padding(.all)
            Button("Hit me".uppercased()) {
                alertIsVisible = true
            }
            .padding(20)
            .background(Color.blue)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
