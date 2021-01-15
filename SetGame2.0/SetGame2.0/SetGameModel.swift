import UIKit

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

extension Array where Element: Equatable {

 // Remove first collection element that is equal to the given `object`:
 mutating func remove(object: Element) {
     guard let index = firstIndex(of: object) else {return}
     remove(at: index)
 }

}

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
    

struct Game {

    var inDeckCards: Array<Card>
    var selectedCards: Array<Card>
    var faceUpCards: Array<Card>
    var matchedCards: Array<Card>

     mutating func choose(card: Card) {
        
        if let chosenIndex: Int = faceUpCards.firstIndex(matching: card) {
            
            if selectedCards.count == 3 {
                
                if (isAllSameColor() || isAllDifferentColor()) && (isAllSameShade() || isAllDifferentShade()) && (isAllSameShape() || isAllDifferentShape())  && (isAllSameCount() || isAllDifferentCount()) {
                    
                    for card in selectedCards{
                        matchedCards.append(card)
                        faceUpCards.remove(object: card)
                        selectedCards.remove(object: card)
                        }
                    addthreecards()
                    print("Set!")
                }
                
                else {
                   selectedCards  = []
                   print("Not a set")
                }
            }
            if let deselectCard: Int = selectedCards.firstIndex(matching: card) {
                selectedCards.remove(object: faceUpCards[chosenIndex])
            }
            else {
                selectedCards.append(faceUpCards[chosenIndex])
            }
        }
    }
                
            
    mutating func addthreecards () -> Void {
        for _ in 1...3 {
            faceUpCards.append(inDeckCards.removeFirst())
        }

    }

    init(){
        
        inDeckCards = Array<Card>()
        selectedCards = Array<Card>()
        faceUpCards = Array<Card>()
        matchedCards = Array<Card>()
        
        var index: Int = 0
        for shape in Card.Shape.allCases{
            for shade in Card.Shade.allCases{
                for color in Card.Color.allCases{
                    for count in 1..<4 {
                        inDeckCards.append(Card(id: index, shape: shape, shade: shade, color: color, count: count))
                        index += 1
                    }
                }
            }
        }

        inDeckCards.shuffle()
        for _ in 0..<12{
            faceUpCards.append(inDeckCards.removeFirst())
        }
    }
        
        
        struct Card: Identifiable, Equatable{
            var id: Int

            var shape: Shape
            var shade: Shade
            var color: Color
            var count: Int
            
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
    
        func isAllSameColor () -> Bool {
            return selectedCards[0].color == selectedCards[1].color && selectedCards[2].color == selectedCards[1].color && selectedCards[2].color == selectedCards[0].color
        }

        func isAllDifferentColor () -> Bool {
            return selectedCards.map{ $0.color} .unique().count == 3
        }

        func isAllSameShade () -> Bool {
            return selectedCards[0].shade == selectedCards[1].shade && selectedCards[2].shade == selectedCards[1].shade && selectedCards[2].shade == selectedCards[0].shade
        }

        func isAllDifferentShade () -> Bool {
            return selectedCards.map{ $0.shade} .unique().count == 3

        }

        func isAllSameShape () -> Bool {
            return selectedCards[0].shape == selectedCards[1].shape && selectedCards[2].shape == selectedCards[1].shape && selectedCards[2].shape == selectedCards[0].shape    }

        func isAllDifferentShape () -> Bool {
            return selectedCards.map{ $0.shape} .unique().count == 3

        }

        func isAllSameCount () -> Bool {
            return selectedCards[0].count == selectedCards[1].count && selectedCards[2].count == selectedCards[1].count && selectedCards[2].count == selectedCards[0].count
        }

        func isAllDifferentCount () -> Bool {
            return selectedCards.map{ $0.count}.unique().count == 3
        }


    }

