//
//  SetViewModel.swift
//  SetGame2.0
//
//  Created by Louis Melone on 1/13/21.
//

import SwiftUI

class SetViewModel: ObservableObject {

    @Published private var game: Game
    
    private static func createGame () -> Game {
        return Game()
    }
    
    init(){
        game = SetViewModel.createGame()
    }
    
    // MARK: - Access to the Model
    
    var faceUpCards: Array<Game.Card>{
        return game.faceUpCards
    }
    
    var inDeckCards: Array<Game.Card>{
        return game.inDeckCards
    }
    
    var matchedCards: Array<Game.Card>{
        return game.matchedCards
    }
    
    var selectedCards: Array<Game.Card>{
        return game.selectedCards
    }
    
    
    //MARK: - Intent(s)
    
    func choose(card: Game.Card){
        return game.choose(card: card)
    }
    
    func restart() {
        return game = SetViewModel.createGame()
    }
    
    func addThreeCards() {
        return game.addthreecards()
    }
    
}

