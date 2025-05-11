//
//  String+RandomString.swift
//  ScoutMotorsWeatherTests
//
//  Created by Jayme Becker on 5/10/25.
//

import Foundation

extension String {
    /// Static func to provide a random string
    /// - Returns: A randomly generated-ish string :D
    static func randomString() -> String {
        let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        let randomLength = Array(0..<Int.random(in: 0...10))
        let charactersArray = randomLength.map { _ in
            characters.randomElement()!
        }
        
        return String(charactersArray)
    }
}
