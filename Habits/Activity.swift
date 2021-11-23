//
//  Activity.swift
//  Habits
//
//  Created by Jameson Hurst on 11/23/21.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0

    static let example = Activity(title: "Example activity", description: "This is a test activity.")
}
