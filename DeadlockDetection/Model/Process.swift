//
//  Process.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 06/06/23.
//

import Foundation
class Process: GraphNode, ObservableObject, Identifiable {


    @Published var next = [GraphNode]()
    var isVisited: Bool = false
    @Published var position: CGPoint = CGPoint(x: 200, y: 200)
    
    var id = UUID()
    @Published var currentResources = [(resource: Resource, time: Int)]()
    @Published var requestedResource: Resource?
    @Published var isSleeping: Bool = false
    let askResourceTimeSpan: Double
    let useResourceTimeSpan: Double

    
    func addResource(resource: Resource) {
        DispatchQueue.main.sync { [self] in
            self.currentResources.append((resource: resource,time: Int(useResourceTimeSpan)))
            self.next.append(resource)
        }

    }
    

    func askNewResource() {
        
        if self.requestedResource == nil {
            let availableResources = OperationalSystem.shared.resources.filter { element in
                return !currentResources.contains(where: {$0.resource.id == element.id})
            }
            if let resource = availableResources.randomElement() {
                DispatchQueue.main.sync {
                    self.requestedResource = resource
                }

                resource.addProcess(process: self)
                OperationalSystem.shared.updateView()
                DispatchQueue.main.sync {
                    self.isSleeping = true
                }
                self.requestedResource!.isBeingUsed.wait()
                DispatchQueue.main.sync {
                    self.isSleeping = false
                }
                resource.removeProcess(process: self)
                OperationalSystem.shared.updateView()
                addResource(resource: resource)
                OperationalSystem.shared.updateView()
                DispatchQueue.main.sync {
                    self.requestedResource = nil
                }

                OperationalSystem.shared.updateView()
            }
        }
        
    }
    
    func useResource() {
        
        for index in currentResources.indices.reversed() {
            if currentResources[index].time > 0 {
                DispatchQueue.main.sync {
                    currentResources[index].time -= 1
                }

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

            DispatchQueue.main.sync {
                currentResources.remove(at: index)
                self.next.remove(at: index)
            }

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

