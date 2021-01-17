//
//  SetGameView.swift
//  
//
//  Created by Louis Melone on 1/13/21.
//

import SwiftUI

struct SetGameView: View {
    
    @ObservedObject var SetVM: SetViewModel

    var body: some View {
        VStack{
            Grid(SetVM.faceUpCards) { card in
                CardView(card: card).onTapGesture {
                    SetVM.choose(card: card)
                }
            }
        
            HStack {
                Button(action: { SetVM.addThreeCards()}
                       , label: { Text("Add 3 Cards") } )
                
                Button(action: { SetVM.restart()}
                       , label: { Text("New Game") } )
            }
        }
    }
}

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
                            Circle().fill(color).opacity(opacity)
                            Circle().stroke(color)
                        }
                    }
                    
                }
            }
            .padding(15)
            .cardify()

    }
}


// struct SwiftUIView_Previews: PreviewProvider {
    // static var previews: some View {
      //  SwiftUIView()
   // }
// }
