//
//  Cardify.swift
//  Memorize2.0
//
//  Created by Louis Melone on 12/29/20.
//



import SwiftUI

struct Cardify: ViewModifier {
    //This ViewModifier takes some 'content' and puts it on a card
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
            RoundedRectangle(cornerRadius: cornerRadius).stroke(Color.black, lineWidth: edgeLineWidth)
            content
            }
        .aspectRatio(1.25, contentMode: .fit)
        .padding(1.5)
        }

    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    
}

extension View {
    func cardify() -> some View {
        self.modifier(Cardify())
    }
}
    
 

