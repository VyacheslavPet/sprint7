//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Петров Вячеслав on 18.12.2025.
//

import Foundation

protocol QuestionFactoryProtocol {
    func loadData()
    func requestNextQuestion()
    func reset()
}

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error)
}
