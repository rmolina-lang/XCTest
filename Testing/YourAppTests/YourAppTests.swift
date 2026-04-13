//
//  YourAppTests.swift
//  YourAppTests
//
//  Created by Raymond Molina on 13/04/2026.
//

import XCTest
@testable import Testing

final class YourAppTests: XCTestCase {

    var sut: TaskViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = TaskViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testAddTask(){
        var tasks = [Task]()
        let newTask = Task(title: "Test Task", isCompleted: false)
        
        tasks.append(newTask)
        
        XCTAssertEqual(tasks.count, 1)
        XCTAssertEqual(tasks.first?.title, "Test Task")
    }
    
    func testToggleTaskCompletion(){
        var task = Task(title: "Test", isCompleted: false)
        
        task.isCompleted.toggle()
        
        XCTAssertTrue(task.isCompleted)
    }
    
    func testDeleteTask() {
        sut.tasks = [
            Task(title: "Test Task 1", isCompleted: false),
            Task(title: "Test Task 2", isCompleted: true)
        ]
        
        sut.deleteTask(at: IndexSet(integer: 0))
        
        XCTAssertEqual(sut.tasks.count, 1)
        XCTAssertEqual(sut.tasks.first?.title, "Test Task 2")
    }
    
    func testEmptyTaskNotAdded() {
        let taskTitle = ""
        XCTAssertTrue(taskTitle.isEmpty)
    }
    
    func testVeryLongTaskTitle(){
        let longTitle = String(repeating: "a", count: 10000)
        XCTAssertFalse(sut.isValidTitleLength(title: longTitle))
    }
    
    func testDuplicatesNotAdded() {
        sut.addTask(title: "Task 1")
        sut.addTask(title: "Task 1")
        XCTAssertEqual(sut.tasks.count, 1)
    }

}
