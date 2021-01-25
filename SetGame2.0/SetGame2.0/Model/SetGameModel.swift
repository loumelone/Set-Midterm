import UIKit

struct Game {

    var inDeckCards: Array<Card>
    var selectedCards: Array<Card>
    var faceUpCards: Array<Card>
    var matchedCards: Array<Card>
    
    var score: Int = 0
    var isMatchedSet: Int = 2

    mutating func choose(card: Card) {
                
        if let chosenIndex: Int = faceUpCards.firstIndex(matching: card) {
            
            isMatchedSet = 2
            
            if selectedCards.count == 3 {
                checkForSet()
            }
    
            if let deselectCard: Int = selectedCards.firstIndex(matching: card){
                selectedCards.remove(object: faceUpCards[chosenIndex])
                faceUpCards[chosenIndex].isSelected = false
            }
            
            else {
                selectedCards.append(faceUpCards[chosenIndex])
                faceUpCards[chosenIndex].isSelected = true
            }
            
            if selectedCards.count == 3 {
                if SetIsMatched(){
                    score = score + 3
                    isMatchedSet = 1
                }
                else{
                    score = score - 5
                    isMatchedSet = 0
                }
            }
            
        }
    }
                
    mutating func addthreecards () -> Void {
        
        if inDeckCards.count == 0 { return }
        
        if selectedCards.count == 3 {
            checkForSet()
        }
        
        else {
            for _ in 1...3 {
                faceUpCards.append(inDeckCards.removeFirst())
            }
        }
        
    }
    
    mutating func checkForSet () -> Void {
            
            if SetIsMatched() {
                for card in selectedCards{
                    matchedCards.append(card)
                    for index in faceUpCards.indices {
                        if card.id == faceUpCards[index].id {
                            faceUpCards[index].isMatched = true
                        }
                    }
                }
                selectedCards  = []
                addthreecards()
            }
            
            else {
                selectedCards  = []
                addthreecards()
            }
                
            for index in faceUpCards.indices {
                faceUpCards[index].isSelected = false
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
    
    func SetIsMatched () -> Bool {
        return (isAllSameColor() || isAllDifferentColor()) && (isAllSameShade() || isAllDifferentShade()) && (isAllSameShape() || isAllDifferentShape())  && (isAllSameCount() || isAllDifferentCount())
        
    }


}

