//
//  CardView.swift
//  SetGame2.0
//
//  Created by Louis Melone on 1/18/21.
//

import SwiftUI

struct CardView: View {
    
    var randomOfffScreenLocation: CGSize{
        let angle : Double = Double.random(in: 0..<(2 * Double.pi))
        return CGSize(width: 1000*cos(angle), height:1000*sin(angle))
    }
    var card: Game.Card
            
    var opacity: Double {
        if card.shade == .dark{ return 1 }
        else if card.shade == .light { return 0.25 }
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
        .transition(AnyTransition.offset(randomOfffScreenLocation))
        .scaleEffect(card.isSelected ? 1.1 : 1)
    }
    
        @ViewBuilder
        private func body(for size: CGSize) -> some View {
                HStack {
                    ForEach(0..<count) { index in
                        ZStack{
                            if card.shape == .rect {
                                Rectangle().fill(color).opacity(opacity).aspectRatio(1.2, contentMode: .fit)
                                Rectangle().stroke(color).aspectRatio(1.2, contentMode: .fit)

                            }
                            else if card.shape == .capsule {
                                Capsule().fill(color).opacity(opacity).aspectRatio(1.5, contentMode: .fit)
                                Capsule().stroke(color).aspectRatio(1.5, contentMode: .fit)
                            }
                            else {
                                Diamond().fill(color).opacity(opacity).aspectRatio(1.4, contentMode: .fit)
                                Diamond().stroke(color).aspectRatio(1.4, contentMode: .fit)

                            }
                            
                        }
                        
                    }

                }
                .padding((4 - CGFloat(count)) * 4)
                .onCard(isSelected: card.isSelected, color: color)
            }
    
    

    }



