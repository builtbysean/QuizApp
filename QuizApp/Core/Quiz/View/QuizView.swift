//
//  QuizView.swift
//  QuizApp
//
//  Created by Sean Coffin on 11/9/25.
//

import SwiftUI

struct QuizView: View {
    @State private var viewModel = QuizViewModel()
    @State private var selectedAnswer: String?
    @State private var scoreIsPresented = false
    
    var body: some View {
        VStack {
            if viewModel.showQuizCompletion {
                QuizCompleteView(scoreIsPresented: $scoreIsPresented)
                    .environment(viewModel)
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.currentQuestion.prompt)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Select an answer below")
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 120)
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Question \(viewModel.currentQuestionIndex + 1) / \(viewModel.quiz.questions.count)")
                        .font(.subheadline)
                        .padding(.horizontal)
                    
                    Divider()
                }
                .padding(.bottom)
                
                VStack(spacing: 12) {
                    ForEach(viewModel.currentQuestion.choices, id: \.self) { choice in
                        Button {
                            self.selectedAnswer = choice
                        } label: {
                            Text(choice)
                                .padding(.horizontal)
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.black)
                                .frame(width: 360, height: 52, alignment: .leading)
                                .clipShape(.rect(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(selectedAnswer == choice ? .blue : .gray,
                                                lineWidth: selectedAnswer == choice ? 2 : 1)
                                }
                        }
                        
                    }
                }
                Spacer()
                
                Button {
                    guard let selectedAnswer else { return }
                    viewModel.submitAnswer(selectedAnswer)
                    self.selectedAnswer = nil
                } label: {
                    Text("Submit")
                        .padding(.horizontal)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 52)
                        .background(selectedAnswer == nil ? .gray : .blue)
                        .clipShape(.rect(cornerRadius: 10))
                }
                .disabled(selectedAnswer == nil)
                .opacity(selectedAnswer == nil ? 0.5 : 1)
            }
        }
        .sheet(isPresented: $scoreIsPresented) {
            QuizResultsView()
                .environment(viewModel)
                .presentationDetents([.medium])
        }
    }
}


#Preview {
    QuizView()
}
