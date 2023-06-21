//
//  Resource.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 06/06/23.
//

import Foundation
class Resource: GraphNode, ObservableObject, Identifiable {

    

   @Published var next: [GraphNode] = []
    var isVisited: Bool = false
    @Published var position: CGPoint = CGPoint(x: 200, y: 200)

    @Published var name: String = "?"
    var id = UUID()
    var isBeingUsed = DispatchSemaphore(value: 1)
    var beingRequestedBy = [Process]()
    
    func addProcess(process: Process){
        DispatchQueue.main.sync {
            self.beingRequestedBy.append(process)
            self.next.append(process)
        }

    }
    
    func removeProcess(process: Process) {
        DispatchQueue.main.sync {
            self.beingRequestedBy.removeAll(where: {$0.id == process.id})
            self.next.removeAll(where: {$0.id == process.id})
        }

    }

    func setName(name: String) {
        self.name = name
    }
    
    init() {
    }
}
