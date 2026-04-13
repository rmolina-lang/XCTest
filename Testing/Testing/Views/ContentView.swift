//
//  ContentView.swift
//  Testing
//
//  Created by Raymond Molina on 10/04/2026.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle = ""
    
    var body: some View {
        VStack {
            HStack{
                TextField("Enter Task", text: $newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibilityIdentifier("AddTaskField")
                
                Button("Add"){
                    viewModel.addTask(title: newTaskTitle)
                    newTaskTitle = ""
                }
                .accessibilityIdentifier("AddButton")
            }
            .padding()
            
            List{
                ForEach(viewModel.tasks)
                { task in
                    HStack{
                        Text(task.title).strikethrough(task.isCompleted)
                        
                        Spacer()
                        
                        Button("Strike"){
                            viewModel.toggleTask(id: task.id)
                        }
                        .accessibilityIdentifier("ToggleButton")
                    }
                }
                .onDelete(perform: viewModel.deleteTask)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
