//
//  LogoPuzzleView.swift
//  DemoInterview1
//
//  Created by Ayush Singh on 01/09/25.
//

import SwiftUI
import Foundation

struct LogoPuzzleView: View {
    @StateObject private var viewModel = LogoViewModel()
    
    
    var body: some View {
        VStack(spacing: 20) {
            if !viewModel.logos.isEmpty {
                let logo = viewModel.logos[viewModel.currentIndex]
                
                // Logo image
                AsyncImage(url: URL(string: logo.imgURL)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
            }
            
            HStack{
                let word = viewModel.logos[viewModel.currentIndex].name
                let slots = Array(0..<word.count)
                
                ForEach(Array(slots.enumerated()), id: \.offset) { index, _ in
                    Text(viewModel.selectedLetter.count > index ? viewModel.selectedLetter[index] : "_")
                        .font(.title)
                        .frame(width: 40, height: 40)
                        .background(Color.gray)
                        .cornerRadius(6)
                }
                
                
            }
        }
        .onAppear{
            Task {
                viewModel.fetchLogo()
            }
        }
        .padding()
        
    }
    
}
//
//#Preview {
//    ContentView()
//}
