//
//  onCard.swift
//  Memorize2.0
//
//  Created by Louis Melone on 12/29/20.
//



import SwiftUI

struct oncard: ViewModifier {
    //This ViewModifier takes some 'content' and puts it on a card
    
    var isSelected: Bool
    
    init(isSelected: Bool){
        self.isSelected = isSelected
    }
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
            RoundedRectangle(cornerRadius: cornerRadius).stroke(Color.black, lineWidth: edgeLineWidth)
            RoundedRectangle(cornerRadius: cornerRadius).stroke(Color.yellow, lineWidth: 15).opacity(isSelected ? 0.5 : 0)
            content
            }
        .aspectRatio(1, contentMode: .fit)
        .padding(10)
        }

    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    
}

extension View {
    func onCard(isSelected: Bool) -> some View {
        self.modifier(oncard(isSelected: isSelected))
    }
}
    
 

