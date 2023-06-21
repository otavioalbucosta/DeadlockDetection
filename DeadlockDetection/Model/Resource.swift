//
//  Resource.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 06/06/23.
//

import Foundation
class Resource: GraphNode, ObservableObject, Identifiable {

    var next: [GraphNode] = []
    var isVisited: Bool = false


    var name: String
    var id = UUID()
    var isBeingUsed = DispatchSemaphore(value: 1)
    var beingRequestedBy = [Process]()
    
    func addProcess(process: Process){
        self.beingRequestedBy.append(process)
        self.next.append(process)
    }
    
    func removeProcess(process: Process) {
        self.beingRequestedBy.removeAll(where: {$0.id == process.id})
        self.next.removeAll(where: {$0.id == process.id})
    }
    
    init(name: String) {
        self.name = name
    }
}
