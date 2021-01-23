//
//  Sequence+Unique.swift
//  SetGame2.0
//
//  Created by Louis Melone on 1/18/21.
//

import Foundation

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
    
