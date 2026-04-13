//
//  Task.swift
//  Testing
//
//  Created by Raymond Molina on 13/04/2026.
//
import SwiftUI

struct Task: Identifiable{
    let id = UUID()
    var title: String
    var isCompleted: Bool
}

