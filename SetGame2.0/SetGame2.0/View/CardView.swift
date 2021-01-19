//
//  CardView.swift
//  SetGame2.0
//
//  Created by Louis Melone on 1/18/21.
//

import SwiftUI

struct CardView: View {
    var card: Game.Card
    
    var opacity: Double {
        if card.shade == .dark{ return 1 }
        else if card.shade == .light { return 0.5 }
        else { return 0 }
    }
    
    var color: Color {
        if card.color == .blue { return Color.blue }
        else if card.color == .green { return Color.green }
        else { return Color.red }
    }
    
    var count: Int {
        return card.count
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
        @ViewBuilder
        private func body(for size: CGSize) -> some View {
            HStack {
                ForEach(0..<count) { index in
                    ZStack{
                        if card.shape == .rect {
                            Rectangle().fill(color).opacity(opacity)
                            Rectangle().stroke(color)

                        }
                        else if card.shape == .capsule {
                            Capsule().fill(color).opacity(opacity)
                            Capsule().stroke(color)
                        }
                        else {
                            Diamond().fill(color).opacity(opacity)
                            Diamond().stroke(color)


                        }
                    }
                    
                }

            }
            .padding(15)
            .onCard()

    }
}

