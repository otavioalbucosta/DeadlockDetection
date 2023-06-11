//
//  Process.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 06/06/23.
//

import Foundation
struct Process {
    var id = UUID()
    var currentResource: Resource?
    let askResourceTimeSpan: Int
    let useResourceTimeSpan: Int
    
    mutating func askNewResource(resources: [Resource]) {
        if let resource = resources.randomElement() {
            resource.isBeingUsed.wait()
            self.currentResource = resource
            useResource()
        }else{
            print("There's no available resources")
        }
    }
    
    mutating func useResource() {
        
    }
    
    mutating func freeResource() {
        if let resource = self.currentResource {
            resource.isBeingUsed.signal()
        }
        self.currentResource = nil
        
        
    }
    
    
}
