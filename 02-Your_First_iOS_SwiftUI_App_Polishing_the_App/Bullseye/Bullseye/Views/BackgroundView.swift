//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Anne Freitas on 01/12/23.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            Button {
                game.restart()
            } label: {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5) {
            LabelText(text: title)
            RoundRectTextView(text: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct RingsView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                Circle()
                    .stroke(lineWidth: 20)
                    .fill(
                        RadialGradient(
                            colors: [
                                Color("RingsColor").opacity(0.8 * 0.3),
                                Color("RingsColor").opacity(0)
                            ],
                            center: .center,
                            startRadius: 100,
                            endRadius: 300
                        )
                    )
                    .frame(width: size, height: size)
            }
        }
    }
}

#Preview {
    BackgroundView(game: .constant(Game()))
}
