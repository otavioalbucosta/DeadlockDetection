//
//  Process.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 06/06/23.
//

import Foundation
class Process: GraphNode, ObservableObject, Identifiable {
    var next: GraphNode?
    
    var id = UUID()
    @Published var currentResource: Resource?
    @Published private var usedResources = [Resource]()
    @Published var requestedResource: Resource?
    let askResourceTimeSpan: Double
    let useResourceTimeSpan: Double
    
    func askNewResource(timer: Timer) {
        
        if self.requestedResource == nil {
            let availableResources = OperationalSystem.shared.resources.filter { element in
                return OperationalSystem.shared.resources.contains(where: {$0.id == element.id})
            }
            if let resource = availableResources.randomElement() {
                self.requestedResource = resource
            }else{
                timer.invalidate()
            }
        }
        else if self.requestedResource != nil && self.currentResource == nil {
            self.requestedResource!.isBeingUsed.wait()
            self.currentResource = self.requestedResource
            self.useResource()
        }
        
    }
    
    func useResource() {
        if currentResource != nil {
            requestedResource = nil
            var counting: Double = useResourceTimeSpan
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
                counting -= 1
                print("Resource \(self.currentResource!.name) sendo usada! \(counting) segundos restantes")
                if counting <= 0 {
                    timer.invalidate()
                    self.freeResource()
                }
            })
            
        }
    }

func freeResource() {
    if let resource = self.currentResource {
        resource.isBeingUsed.signal()
        usedResources.append(resource)
    }
    self.currentResource = nil
}

func processRoutine() {
    
    Timer.scheduledTimer(withTimeInterval: askResourceTimeSpan, repeats: true) { timer in
        self.askNewResource(timer: timer)
    }
    
}

init(askResourceTimeSpan: Double, useResourceTimeSpan: Double) {
    self.askResourceTimeSpan = askResourceTimeSpan
    self.useResourceTimeSpan = useResourceTimeSpan
    processRoutine()
}


}
