//
//  TodoList.swift
//  DesafioTableView
//
//  Created by Thiago B Claramunt on 18/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation

class TodoList {
    
    enum Priority: Int, CaseIterable {
        case high, medium, low, no
    }
    
    private var highPriorityTodos: [ChecklistItem] = []
    private var mediumPriorityTodos: [ChecklistItem] = []
    private var lowPriorityTodos: [ChecklistItem] = []
    private var noPriorityTodos: [ChecklistItem] = []
    
    init() {
        let row0Item = ChecklistItem()
        let row1Item = ChecklistItem()
        let row2Item = ChecklistItem()
        let row3Item = ChecklistItem()
        let row4Item = ChecklistItem()
        
        row0Item.text = "Take a jog"
        row1Item.text = "Watch a movie"
        row2Item.text = "Code an app"
        row3Item.text = "Study Design"
        row4Item.text = "Walk the dog"
        
        addTodo(item: row0Item, for: .medium)
        addTodo(item: row1Item, for: .medium)
        addTodo(item: row2Item, for: .medium)
        addTodo(item: row3Item, for: .medium)
        addTodo(item: row4Item, for: .medium)

    }
    
    func addTodo(item: ChecklistItem, for priority: Priority) {
        switch priority {
        case .high:
            return highPriorityTodos.append(item)
        case .medium:
            return mediumPriorityTodos.append(item)
        case .low:
            return lowPriorityTodos.append(item)
        case .no:
            return noPriorityTodos.append(item)
        }
    }
    
    func todoList(for priority: Priority) -> [ChecklistItem] {
        switch priority {
        case .high:
           return highPriorityTodos
        case .medium:
           return mediumPriorityTodos
        case .low:
           return lowPriorityTodos
        case .no:
           return noPriorityTodos
        }
    }
    
    func newTodo() -> ChecklistItem {
        let item: ChecklistItem = ChecklistItem()
        item.text = randomTitle()
        item.checked = true
        mediumPriorityTodos.append(item)
        return item
    }
    
    func move(item: ChecklistItem, to index: Int) {
        //        guard let currentIndex = todos.firstIndex(of: item) else {
        //            return
        //        }
        //        todos.remove(at: currentIndex)
        //        todos.insert(item, at: index)
    }
    
    func remove(items: ChecklistItem, from priority: Priority, at index: Int) {
        switch priority {
        case .high:
            highPriorityTodos.remove(at: index)
        case .medium:
            mediumPriorityTodos.remove(at: index)
        case .low:
            lowPriorityTodos.remove(at: index)
        case .no:
            noPriorityTodos.remove(at: index)
        }
    }
    
    func remove(items: [ChecklistItem]) {
        for item in items {
            if let index = todos.firstIndex(of: item) {
                todos.remove(at: index)
            }
        }
    }
    
    private func randomTitle() -> String {
        var titles: [String] = ["New todo item", "Generic", "More text", "More description"]
        let randomNumber: Int = Int.random(in: 0 ...  titles.count - 1)
        return titles[randomNumber]
    }
}

