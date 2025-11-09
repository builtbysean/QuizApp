//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Sean Coffin on 11/9/25.
//

import Foundation

@Observable
class QuizViewModel {
    let quiz: Quiz
    var currentQuestionIndex = 0
    var showQuizCompletion = false
    var numCorrectAnswers = 0
    
    var currentQuestion: Question {
        return quiz.questions[currentQuestionIndex]
    }
    var numIncorrectAnswers: Int {
        return quiz.questions.count - numCorrectAnswers
    }
    
    var quizScore: Double {
        Double(numCorrectAnswers) / Double(quiz.questions.count) * 100
    }
    
    init() {
        self.quiz = Quiz.mockQuiz
    }
    
    func submitAnswer(_ answer: String) {
        if answer == currentQuestion.answer {
            numCorrectAnswers += 1
        }
        if currentQuestionIndex < quiz.questions.count - 1 {
            currentQuestionIndex += 1
        } else {
           showQuizCompletion = true
        }
    }
    
    func restartQuiz() {
        currentQuestionIndex = 0
        numCorrectAnswers = 0
        showQuizCompletion = false
    }
}
