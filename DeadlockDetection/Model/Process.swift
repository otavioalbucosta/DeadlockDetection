//
//  Process.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 06/06/23.
//

import Foundation
class Process: GraphNode, ObservableObject, Identifiable {

    var next = [GraphNode]()
    var isVisited: Bool = false
    var position: CGPoint = .zero
    
    var id = UUID()
    @Published var currentResources = [(resource: Resource, time: Int)]()
    @Published var requestedResource: Resource?
    let askResourceTimeSpan: Double
    let useResourceTimeSpan: Double
    
    func askNewResource() {
        
        if self.requestedResource == nil {
            let availableResources = OperationalSystem.shared.resources.filter { element in
                return !currentResources.contains(where: {$0.resource.id == element.id})
            }
            if let resource = availableResources.randomElement() {
                self.requestedResource = resource
                resource.beingRequestedBy.append(self)
                resource.next.append(self)
                OperationalSystem.shared.updateView()
                self.requestedResource!.isBeingUsed.wait()
                resource.beingRequestedBy.removeAll(where: {$0.id == self.id})
                resource.next.removeAll(where: {$0.id == self.id})
                OperationalSystem.shared.updateView()
                self.currentResources.append((resource: resource,time: Int(useResourceTimeSpan)))
                self.next.append(resource)
                OperationalSystem.shared.updateView()
                self.requestedResource = nil
                OperationalSystem.shared.updateView()
            }
        }
        
    }
    
    func useResource() {
        
        for index in currentResources.indices.reversed() {
            if currentResources[index].time > 0 {
                currentResources[index].time -= 1
                print("Resource \(currentResources[index].resource.id.description.prefix(5)) sendo usada por \(self.id.description.prefix(5))! \(self.currentResources[index].time) segundos restantes")
            }
            else if currentResources[index].time <= 0 {
                self.freeResource()
            }
        }
    }

func freeResource() {
    
    for index in currentResources.indices.reversed() {
        if currentResources[index].time <= 0 {
            currentResources[index].resource.isBeingUsed.signal()

            currentResources.remove(at: index)
            self.next.remove(at: index)
        }
    }
    OperationalSystem.shared.updateView()
}

func processRoutine() {
    DispatchQueue(label: "com.DeadlockDetection.Routine", qos: .default, attributes: .concurrent).async { [self] in
        var count = 0
        while true {
            sleep(1)
            count += 1
            if count % Int(self.askResourceTimeSpan) == 0 {
                self.askNewResource()
            }
            self.useResource()
        }
    }
    
}
    

init(askResourceTimeSpan: Double, useResourceTimeSpan: Double) {
    self.askResourceTimeSpan = askResourceTimeSpan
    self.useResourceTimeSpan = useResourceTimeSpan
    processRoutine()
    
}


//    2 de memoria 4 pts
//    1q de ES 3
//    2 de sistema de arquivos 3
//    4 pts de calculo 6 pontos subjetivas
}

