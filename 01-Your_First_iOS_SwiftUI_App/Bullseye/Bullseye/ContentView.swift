//
//  ContentView.swift
//  Bullseye
//
//  Created by Anne Freitas on 25/09/23.
//

import SwiftUI

struct ContentView: View {
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
        Slider(value: .constant(50), in: 1.0...100.0)
        Text("100")
          .bold()
          .font(.body)
      }
      Button("Hit me") {
        
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
