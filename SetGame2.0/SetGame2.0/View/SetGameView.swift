//
//  SetGameView.swift
//  
//
//  Created by Louis Melone on 1/13/21.
//

import SwiftUI

struct SetGameView: View {
    
    @ObservedObject var SetVM: SetViewModel

    @State private var isVisible = false
    var randomOfffScreenLocation: CGSize{
        let angle : Double = Double.random(in: 0..<(2 * Double.pi))
        return CGSize(width: 1000*cos(angle), height:1000*sin(angle))
    }
    var onScreen: CGSize = CGSize(width: 0, height: 0)

    
    var body: some View {
        VStack{
            Grid(SetVM.faceUpCards.filter{!$0.isMatched}) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear) {
                        SetVM.choose(card: card)
                    }
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 0.5)) {self.isVisible.toggle()}
                }
            .offset(isVisible ? onScreen : randomOfffScreenLocation )

            
            HStack {
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        SetVM.addThreeCards()
                    }
                }, label: { Text("Add 3 Cards") } )
                    
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)){
                        SetVM.restart()
                    }
                }, label: { Text("New Game") } )
                    
                }
            
            
            ZStack{
                if SetVM.isMatchedSet == 1{
                    Text("This is a SET!")
                }
                else if SetVM.isMatchedSet == 0{
                    Text("This is not a set")
                }
                else{
                    Text("Select Three Cards to Make a Set")
                }
            }
            
        }
    }
}




// struct SwiftUIView_Previews: PreviewProvider {
    // static var previews: some View {
      //  SwiftUIView()
   // }
// }
