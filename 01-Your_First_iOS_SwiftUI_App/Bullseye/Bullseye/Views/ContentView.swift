//
//  ContentView.swift
//  Bullseye
//
//  Created by Anne Freitas on 25/09/23.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var sliderValue: Double = 50.0
  
  var body: some View {
    VStack {
      Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .bold()
        .multilineTextAlignment(.center)
        .lineSpacing(4.0)
        .font(.footnote)
        .kerning(2.0)
      Text("89")
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
      Button(action: {
        print("Hello, SwiftUI!")
        alertIsVisible = true
      }) {
        Text("Hit me")
      }
      .alert(isPresented: $alertIsVisible) {
        return Alert(
          title: Text("Hello there"),
          message: Text("This is my first popup"),
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
