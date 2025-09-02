//
//  ViewModel.swift
//  DemoInterview1
//
//  Created by Ayush Singh on 01/09/25.
//

import SwiftUI

class LogoViewModel: ObservableObject {
    
    @Published var logos: [Logo] = []
    @Published var currentIndex = 0
    
    @Published var selectedLetter: [String] = []
    @Published var keyboardLetter: [String] = []
    
    func fetchLogo() {
        // json to url
        let json = """
{
  "logos": [
    {
      "imgUrl": "https://upload.wikimedia.org/wikipedia/commons/3/33/Meesho_logo.png",
      "name": "MEESHO"
    },
    {
      "imgUrl": "https://www.dsource.in/sites/default/files/resource/logo-design/logos/logos-representing-india/images/01.jpeg",
      "name": "AADHAAR"
    },
    {
      "imgUrl": "https://cdn.iconscout.com/icon/free/png-256/bhim-3-69845.png",
      "name": "BHIM"
    }
  ]
}
"""
        
        if let data = json.data(using: .utf8) {
            let decoder = try? JSONDecoder().decode(LogoResponse.self, from: data)
            logos = decoder?.logos ?? [] }
        
    }
    
    func letters(_ word: String) -> [String] {
        var letters: [String] = word.map{String($0)}
        
        while letters.count < 20 {
            let randomChar = String(UnicodeScalar(Int.random(in: 65...90))!)
            letters.append(randomChar)
        }
        
        return letters.shuffled()
    }
    
    func check(_ word: String) {
        fetchLogo()

        let word = logos[currentIndex].name
        let attempt = selectedLetter.joined()
        
        // success case
        if attempt == word {
            // success case 
            nextLogo()
        } else if selectedLetter.count == word.count {
            selectedLetter.removeAll()
        }
    }
    
    func nextLogo() {
        currentIndex = (currentIndex + 1) % logos.count
        selectedLetter.removeAll()
        letters(logos[currentIndex].name)
    }
}
