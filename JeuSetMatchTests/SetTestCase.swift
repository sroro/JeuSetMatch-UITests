//
//  SetTestCase.swift
//  JeuSetMatchTests
//
//  Created by Rodolphe Schnetzer on 25/12/2019.
//  Copyright © 2019 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

class SetTestCase: XCTestCase {

       var set = Set()

        override func setUp() {
            super.setUp()
            set = Set()
        }

        func createManyGames(_ count: Int, wonByPlayer player: Player) {
            for _ in 1...count {
                let game = Game()
                game.winner = player
                set.games.append(game)
            }
        }

    // la propriété calculée scores fonctionne bien. Les scores doivent correspondre au nombre de jeux gagnés par chaque joueur.
        func testGivenPlayerWinsByThreeGamesToTwo_WhenGettingScoreFromSet_ThenScoreShouldBeThreeToTwo() {
            createManyGames(2, wonByPlayer: .one)
            createManyGames(3, wonByPlayer: .two)

            XCTAssertEqual(set.scores[.one], 2)
            XCTAssertEqual(set.scores[.two], 3)
        }

    //Testez que la propriété calculée winner fonctionne bien. Elle doit être à nil, si la partie n'est pas terminée.
    func testGivenSetIsNotOver_WhenGettingWinner_ThenWinnerShouldBeNil() {
            XCTAssertNil(set.winner)
        }

    //Testez que si le joueur 1 a gagné 6 jeux, le set est terminé et gagné par le joueur 1.
        func testGivenPlayerOneHasWonSixGames_WhenGettingWinner_ThenWinnerShouldBePlayerOne() {
            createManyGames(6, wonByPlayer: .one)

            XCTAssertEqual(set.winner, .one)
            XCTAssertEqual(set.isOver, true)
        }

}
