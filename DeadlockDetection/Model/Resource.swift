//
//  Resource.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 06/06/23.
//

import Foundation
class Resource: GraphNode, ObservableObject, Identifiable {
    
    
    var next: GraphNode?
    var name: String
    var id = UUID()
    var isBeingUsed = DispatchSemaphore(value: 1)
    var beingRequestedBy: Process? {
        didSet{
            next = beingRequestedBy!
        }
    }
    
    
    init(name: String) {
        self.name = name
    }
}
