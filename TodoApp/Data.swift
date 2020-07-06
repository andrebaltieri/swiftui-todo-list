//
//  File.swift
//  TodoApp
//
//  Created by Andre Baltieri on 05/07/20.
//  Copyright © 2020 Andre Baltieri. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable {
    var id = String()
    var todoItem = String()
}

class TaskStore: ObservableObject {
    @Published var tasks = [Task]()
}
