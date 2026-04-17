//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Петров Вячеслав on 03.03.2026.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
    func didLoadDataFromServer()
    func didFailToLoadData(with error: Error)
}
