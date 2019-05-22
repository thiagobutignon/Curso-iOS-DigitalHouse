//
//  TodoList.swift
//  DesafioTableView
//
//  Created by Thiago B Claramunt on 18/05/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import Foundation

class TodoList {
    var todos: [ChecklistItem] = []
    
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
        
        todos.append(row0Item)
        todos.append(row1Item)
        todos.append(row2Item)
        todos.append(row3Item)
        todos.append(row4Item)
    }
    
    func newTodo() -> ChecklistItem {
        let item: ChecklistItem = ChecklistItem()
        item.text = randomTitle()
        item.checked = true
        todos.append(item)
        return item
    }
    
    func move(item: ChecklistItem, to index: Int) {
        guard let currentIndex = todos.firstIndex(of: item) else {
            return
        }
        todos.remove(at: currentIndex)
        todos.insert(item, at: index)
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

