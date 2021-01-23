//
//  Card.swift
//  SetGame2.0
//
//  Created by Louis Melone on 1/18/21.
//

import Foundation

extension Game {
    struct Card: Identifiable, Equatable {
        var id: Int

        var shape: Shape
        var shade: Shade
        var color: Color
        var count: Int
        var isSelected: Bool = false
        var isMatched: Bool = false
        
        enum Shape: CaseIterable {
            case rect
            case capsule
            case diamond
        }
        enum Shade: CaseIterable {
            case empty
            case light
            case dark
        }
        enum Color: CaseIterable {
            case red
            case blue
            case green
        }

    }
}
