//
//  ContentView.swift
//  TodoApp
//
//  Created by Andre Baltieri on 05/07/20.
//  Copyright © 2020 Andre Baltieri. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newTodo: String = ""
    
    var searchBar: some View {
        HStack {
            TextField("Nova tarefa", text: self.$newTodo)
            Button(action: addNewTodo, label: {
                Text("Salvar")
            })
        }
    }
    
    func addNewTodo() {
        taskStore.tasks.append(Task(
            id: String(taskStore.tasks.count + 1),
            todoItem: newTodo
        ))
        newTodo = ""
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List {
                    ForEach(taskStore.tasks) {
                        task in
                        Text(task.todoItem)
                    }
                    .onMove(perform: move)
                    .onDelete(perform: delete)
                }
                .navigationBarTitle("Tarefas")
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at index: IndexSet) {
        taskStore.tasks.remove(atOffsets: index)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
