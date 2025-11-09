//
//  ScoreView.swift
//  QuizApp
//
//  Created by Sean Coffin on 11/9/25.
//

import SwiftUI

struct QuizResultsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(QuizViewModel.self) private var viewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("You scored")
                        .font(.title3).bold()
                    
                    Spacer()
                    
                    Button { dismiss() } label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    }
                }
                Text(String(format: "%.0f%%", viewModel.quizScore))
                    .font(.system(size: 80, weight: .bold))
                    .foregroundStyle(.blue)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .frame(height: 200)
            
            Text("Statistics")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            HStack {
                Text("Correct Answers")
                    .fontWeight(.semibold)
                
                
                Spacer()
                
                Text("\(viewModel.numCorrectAnswers) / \(viewModel.quiz.questions.count)")
            }
            .font(.subheadline)
            .padding(.horizontal)
            .frame(width: 360, height: 64)
            .background(Color(.systemGroupedBackground))
            .clipShape(.rect(cornerRadius: 20))
            
            HStack {
                Text("Incorrect Answers")
                    .fontWeight(.semibold)
                
                
                Spacer()
                
                Text("\(viewModel.numIncorrectAnswers) / \(viewModel.quiz.questions.count)")
                    .foregroundStyle(.red)
            }
            .font(.subheadline)
            .padding(.horizontal)
            .frame(width: 360, height: 64)
            .background(Color(.systemGroupedBackground))
            .clipShape(.rect(cornerRadius: 20))
        }
    }
}

#Preview {
    QuizResultsView()
        .environment(QuizViewModel())
}
