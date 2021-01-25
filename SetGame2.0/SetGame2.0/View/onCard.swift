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
    var color: Color
    
    init(isSelected: Bool, color: Color){
        self.isSelected = isSelected
        self.color = color
    }
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
            RoundedRectangle(cornerRadius: cornerRadius).stroke(color, lineWidth: edgeLineWidth).opacity(isSelected ? 0 : 1)
            RoundedRectangle(cornerRadius: cornerRadius).stroke(Color.yellow, lineWidth: 7).opacity(isSelected ? 0.5 : 0)
            content
            }
        .aspectRatio(1, contentMode: .fit)
        .padding(10)
        }

    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 1
    
}

extension View {
    func onCard(isSelected: Bool, color: Color) -> some View {
        self.modifier(oncard(isSelected: isSelected, color: color))
    }
}
    
 

