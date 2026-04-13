//
//  TaskViewModel.swift
//  Testing
//
//  Created by Raymond Molina on 13/04/2026.
//

import SwiftUI
import Foundation
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    func addTask(title: String) {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else {
            print("Title is empty or is only whitespaces")
            return
        }
        
        guard isValidTitleLength(title: trimmedTitle) else {
            print("Task name length is too long")
            return
        }
        guard !tasks.contains(where: { $0.title == trimmedTitle}) else {
            print("Task already Exists")
            return
        }
        let newTask = Task(title: trimmedTitle, isCompleted: false)
        tasks.append(newTask)
    }
        
    func toggleTask(id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted.toggle()
        }
    }
        
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    func isValidTitleLength(title: String, size: Int = 30) -> Bool {
        title.count <= size
    }
    

}
