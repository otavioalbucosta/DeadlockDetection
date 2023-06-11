//
//  Resource.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 06/06/23.
//

import Foundation
struct Resource {
    var name: String
    var id: UUID
    var isBeingUsed = DispatchSemaphore(value: 1)
}
