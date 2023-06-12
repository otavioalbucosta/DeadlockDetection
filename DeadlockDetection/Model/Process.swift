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
    var currentResource: Resource?
    private var usedResources = [Resource]()
    var requestedResource: Resource?
    let askResourceTimeSpan: Int
    let useResourceTimeSpan: Int
    
    func askNewResource() {
        let availableResources = OperationalSystem.shared.resources.filter { element in
            return OperationalSystem.shared.resources.contains(where: {$0.id == element.id})
        }
        if let resource = availableResources.randomElement() {
            resource.beingRequestedBy = self
            self.requestedResource = resource
            resource.isBeingUsed.wait()
            self.currentResource = resource
            useResource()
        }else{
            print("There's no available resources")
        }
    }
    
    func useResource() {
        requestedResource = nil
        var counting: Int = useResourceTimeSpan
        while counting > 0 {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                counting -= 1
                print("Resource \(self.currentResource!.name) sendo usada! \(counting) segundos restantes")
                
            }
        }
        freeResource()
        
    }
    
    func freeResource() {

        if let resource = self.currentResource {
            resource.isBeingUsed.signal()
            usedResources.append(resource)
        }
        self.currentResource = nil
    }
    
    func processRoutine() {
        DispatchQueue(label: "com.DeadlockDetection.ProcessRoutine", qos: .utility, attributes: .concurrent).async{
            while OperationalSystem.shared.resources.count != self.usedResources.count {
                
            }
        }
        
    }
    
    init(askResourceTimeSpan: Int, useResourceTimeSpan: Int) {
        self.askResourceTimeSpan = askResourceTimeSpan
        self.useResourceTimeSpan = useResourceTimeSpan
    }
    
    
}
