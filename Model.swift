//
//  Model.swift
//  DemoInterview1
//
//  Created by Ayush Singh on 01/09/25.
//
// MARK: - Welcome
struct LogoResponse: Codable {
    let logos: [Logo]
}

// MARK: - Logo
struct Logo: Codable {
    let imgURL: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case imgURL = "imgUrl"
        case name
    }
}
