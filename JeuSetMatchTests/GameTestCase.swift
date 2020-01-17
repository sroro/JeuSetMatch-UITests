//
//  GameTestCase.swift
//  JeuSetMatchTests
//
//  Created by Rodolphe Schnetzer on 25/12/2019.
//  Copyright © 2019 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class GameTestCase: XCTestCase {
    var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    
    func testGivenScoreIsNull_WhenIncrementingPlayerScore_ThenScoreShouldBeFiften() {
        // Given: Etant donné que...[Situation de départ]
     
        
        // When: Quand...[Action]
        game.incrementScore(forPlayer: .one)
        
        //Then: Alors...[Situation Arrivée]
        XCTAssert(game.scores[.one]! == 15)
        XCTAssert(game.scores[.two]! == 0)
    }
    
    func testGivenScoreIsFifteen_WhenIncrementingPlayerScore_ThenScoreShouldBeThirty() {
        //Given
        game.scores[.one] = 15
        
        // When
        
        game.incrementScore(forPlayer: .one)
        
        //Then
        XCTAssert(game.scores[.one]! == 30)
        XCTAssert(game.scores[.two]! == 0)
    }
    
    func testGivenScoreIsThirty_WhenIncrementingPlayerScore_ThenScoreShouldBeForty() {
        //Given
        game.scores[.one] = 30
        
        // When
        
        game.incrementScore(forPlayer: .one)
        
        //Then
        XCTAssert(game.scores[.one]! == 40 )
        XCTAssert(game.scores[.two]! == 0)
    }
    
    func testGivenScoreIsForty_WhenIncrementingPlayerScore_ThenShouldBeWonSet(){
        game.scores[.one] = 40
        
        game.incrementScore(forPlayer: .one)
        
        // Très utile, cette variante prend deux paramètres et le test réussit s'ils sont égaux. L'opposé XCTAssertNotEqual existe également.
        XCTAssertEqual(game.winner, .one)
        //Elle fonctionne exactement comme XCTAssert, mais elle est plus lisible. L'opposé XCTAssertFalse existe également.
        XCTAssertTrue(game.isOver)
        
    }

}
