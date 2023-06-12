//
//  OperationalSystem.swift
//  DeadlockDetection
//
//  Created by Otávio Albuquerque on 06/06/23.
//

import Foundation

class OperationalSystem: ObservableObject {
    @Published var resources = [Resource]()
    @Published var processes = [Process]()
    @Published var timeInterval: Int
    
    static var shared = OperationalSystem(timeInterval: 5)
    
    func setTimeInterval(time:Int){
        self.timeInterval = time
    }
    
    init(timeInterval:Int) {
        self.timeInterval = timeInterval
    }
    
    func dfs(graph: GraphNode) -> Bool{
        var currentGraph = graph
        var graphSet = [GraphNode]()
        
        repeat {
            if graphSet.contains(where: {$0.id == currentGraph.id}) {
                return false
            }else{
                graphSet.append(currentGraph)
            }
            currentGraph = currentGraph.next!
        } while currentGraph.next != nil
        
        return true
        
    }
    
    func resourceFactory(name: String) -> Resource{
        let resource = Resource(name: name)
        self.resources.append(resource)
        return resource
    }
    
    
    func processFactory(askTime: Int, useTime: Int) -> Process {
        let process = Process(askResourceTimeSpan: askTime, useResourceTimeSpan: useTime)
        self.processes.append(process)
        return process
    }
    
    
}
