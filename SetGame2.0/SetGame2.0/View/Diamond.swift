//
//  Diamond.swift
//  SetGame2.0
//
//  Created by Louis Melone on 1/19/21.
//

import SwiftUI

struct Diamond: Shape {

    func path(in rect: CGRect) -> Path {
        
        var p = Path()
        p.move(to: CGPoint(x: rect.midX, y: rect.minY))
        
        p.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        p.move(to: CGPoint(x: rect.minX, y: rect.midY))

        p.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        p.move(to: CGPoint(x: rect.midX, y: rect.maxY))

        p.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        p.move(to: CGPoint(x: rect.maxX, y: rect.midY))

        p.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        p.move(to: CGPoint(x: rect.midX, y: rect.minY))


        return p
    }
}



