//
//  QuizCompleteView.swift
//  QuizApp
//
//  Created by Sean Coffin on 11/9/25.
//

import SwiftUI

struct QuizCompleteView: View {
    @Environment(QuizViewModel.self) private var viewModel
    @Binding var scoreIsPresented: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Congratulations, you've completed the quiz!")
                .font(.title)
                .multilineTextAlignment(.center)
            
            Text("Click below to view your results")
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        
        Button("View Results") {
            scoreIsPresented.toggle()
        }
        .foregroundStyle(.white)
        .font(.headline)
        .frame(width: 350, height: 48)
        .background(.blue)
        .clipShape(.rect(cornerRadius: 20))
        .padding()
        
        
        Button("Start Over") {
            viewModel.restartQuiz()
        }
        .font(.headline)
    }
}
#Preview {
    QuizCompleteView(scoreIsPresented: .constant(false))
        .environment(QuizViewModel())
}
