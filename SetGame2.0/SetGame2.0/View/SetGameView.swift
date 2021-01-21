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
            Grid(SetVM.faceUpCards.filter{!$0.isMatched}) { card in
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



// struct SwiftUIView_Previews: PreviewProvider {
    // static var previews: some View {
      //  SwiftUIView()
   // }
// }
