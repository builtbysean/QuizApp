//
//  Quiz.swift
//  QuizApp
//
//  Created by Sean Coffin on 11/9/25.
//

import Foundation

struct Quiz {
    let questions: [Question]
}

struct Question: Identifiable {
    let id: String = UUID().uuidString
    let prompt: String
    let choices: [String]
    let answer: String
}

extension Quiz {
    static let mockQuiz = Quiz(questions: Question.mockQuestions)
}

extension Question {
    static let mockQuestions: [Question] = [
        Question(prompt: "What is the capital of France?",
                 choices: ["Paris", "Berlin", "Madrid", "Rome"],
                 answer: "Paris"),
        Question(prompt: "Which planet is known as the Red Planet?",
                 choices: ["Venus", "Mars", "Jupiter", "Mercury"],
                 answer: "Mars"),
        Question(prompt: "What is 9 × 7?",
                 choices: ["56", "63", "72", "81"],
                 answer: "63"),
        Question(prompt: "Who wrote 'To Kill a Mockingbird'?",
                 choices: ["Harper Lee", "Mark Twain", "Jane Austen", "F. Scott Fitzgerald"],
                 answer: "Harper Lee"),
        Question(prompt: "Which language is primarily used for iOS development?",
                 choices: ["Kotlin", "Swift", "Java", "C#"],
                 answer: "Swift"),
        Question(prompt: "What gas do plants primarily absorb for photosynthesis?",
                 choices: ["Oxygen", "Nitrogen", "Carbon Dioxide", "Hydrogen"],
                 answer: "Carbon Dioxide"),
        Question(prompt: "Which ocean is the largest by surface area?",
                 choices: ["Atlantic Ocean", "Indian Ocean", "Pacific Ocean", "Arctic Ocean"],
                 answer: "Pacific Ocean"),
        Question(prompt: "What year did the first iPhone launch?",
                 choices: ["2005", "2007", "2009", "2011"],
                 answer: "2007")
    ]
}
