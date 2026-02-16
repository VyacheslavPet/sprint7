//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Петров Вячеслав on 22.12.2025.
//
import Foundation

final class StatisticService: StatisticServiceProtocol {
    private let storage: UserDefaults = .standard
    var gamesCount: Int {
        get {
            storage.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.bestGameCorrect.rawValue)
            let total = storage.integer(forKey: Keys.bestGametotal.rawValue)
            let date = storage.object(forKey: Keys.bestGameDate.rawValue) as? Date ?? Date()
            return GameResult(correct: correct, total: total, date: date)
        }
        set {
            storage.set(newValue.correct, forKey: Keys.bestGameCorrect.rawValue)
            storage.set(newValue.total, forKey: Keys.bestGametotal.rawValue)
            storage.set(newValue.date, forKey: Keys.bestGameDate.rawValue)
        }
    }
    
    var totalAccuracy: Double {
        let totalCorrectAnswers = storage.integer(forKey: Keys.totalCorrectAnswers.rawValue)
        let totalQuestionsAsked = storage.integer(forKey: Keys.totalQuestionsAsked.rawValue)
        guard totalQuestionsAsked > 0 else {
            return 0.0
        }
        return Double(totalCorrectAnswers) / Double(totalQuestionsAsked) * 100.0
    }
    
    func store(correct count: Int, total amount: Int) {
        gamesCount += 1
        let currentGameResult = GameResult(correct: count, total: amount, date: Date())
        if bestGame.correct == 0 || currentGameResult.isBetterThan(bestGame) {
            bestGame = currentGameResult
        }
        
        let currentTotalCorrect = storage.integer(forKey: Keys.totalCorrectAnswers.rawValue)
        let currentTotalQuestions = storage.integer(forKey: Keys.totalQuestionsAsked.rawValue)
        
        storage.set(currentTotalCorrect + count, forKey: Keys.totalCorrectAnswers.rawValue)
        storage.set(currentTotalQuestions + amount, forKey: Keys.totalQuestionsAsked.rawValue)
    }
    
    private enum Keys: String {
        case gamesCount
        case bestGameCorrect
        case bestGametotal
        case bestGameDate
        case totalCorrectAnswers
        case totalQuestionsAsked
    }
}
