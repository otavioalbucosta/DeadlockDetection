//
//  Graph.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 11/06/23.
//

import Foundation

protocol GraphNode {
    var id: UUID {get set}
    var next: [GraphNode] {get set}
    var isVisited: Bool {get set}
    var position: CGPoint {get set}
}
