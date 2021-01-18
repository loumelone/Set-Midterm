//
//  Array+Remove.swift
//  SetGame2.0
//
//  Created by Louis Melone on 1/18/21.
//

import Foundation

extension Array where Element: Equatable {

 // Remove first collection element that is equal to the given `object`:
 mutating func remove(object: Element) {
     guard let index = firstIndex(of: object) else {return}
     remove(at: index)
 }

}
