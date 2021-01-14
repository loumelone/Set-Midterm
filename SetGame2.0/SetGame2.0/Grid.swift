//
//  Grid.swift
//  Memorize2.0
//
//  Created by Louis Melone on 12/22/20.
//
// we want to use self. to define when something is a parameter or a function or a local variable to the function

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View{
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    // since WE initilize these vars in our init, they can be private
    
    
    
    
    /// the @escaping will keep this function in the heap so its around next time someone 'taps'
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView){
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
            
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
            }
        }

    

// we would like our program to crash if we can't unwrap our int because this means something has gone terribly wrong
// but we will not do this. we can use group to return some empty view if index is nil instead
// gridlayout divides up the space, then we offer it up to subviews and position them at locations in gridlayout
