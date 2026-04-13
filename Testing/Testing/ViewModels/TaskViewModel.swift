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
    
        func addTask(title:String){
            guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
                print("Title is empty or is only whitespaces")
                return
            }
            
            let newTask = Task(title: title, isCompleted: false)
            tasks.append(newTask)
        }
        
        func toggleTask(id: UUID){
            if let index = tasks.firstIndex(where: {$0.id == id}){
                tasks[index].isCompleted.toggle()
            }
        }
        
        func deleteTask(at offsets: IndexSet){
            tasks.remove(atOffsets: offsets)
        }
    
}
