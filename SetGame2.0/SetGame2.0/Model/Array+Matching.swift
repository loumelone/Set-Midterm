//
//  Array+Matching.swift
//  SetGame2.0
//
//  Created by Louis Melone on 1/18/21.
//

import Foundation

extension Array where Element: Identifiable{
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }

}
