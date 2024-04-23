//
//  ScoreViewModel.swift
//  handling errors
//
//  Created by Ivan Petrunin on 04.03.2024.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}
