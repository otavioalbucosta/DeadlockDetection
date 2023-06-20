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
    @Published var deadlockFound: Bool = false
    @Published var timeRemaining: Int
    
    static var shared = OperationalSystem(timeInterval: 5)
    
    func setTimeInterval(time:Int){
        self.timeInterval = time
        self.timeRemaining = time
        OSRoutine()
    }
    
    init(timeInterval:Int) {
        self.timeInterval = timeInterval
        self.timeRemaining = timeInterval
    }
    
    func dfs(root: GraphNode?, graphSet: [GraphNode] = [] ) -> [GraphNode]{
        var set = graphSet
        guard var root = root else { return [] }
        
        print(root.id.description.prefix(5))
        root.isVisited = true
        set.append(root)
        for edge in root.next {
            if !edge.isVisited {
//                criar grafo
                set.append(contentsOf: dfs(root: edge))
            }else {
                set.append(edge)
                break
            }
        }
        return set
    }
    
    func resourceFactory(name: String){
        let resource = Resource(name: name)
        self.resources.append(resource)
    }
    
    
    func processFactory(askTime: Double, useTime: Double) {
        if processes.count <= 10 {
            let process = Process(askResourceTimeSpan: askTime, useResourceTimeSpan: useTime)
            self.processes.append(process)
        } else {
            print("Não permito criação de mais de 10 processos.")
        }
    }

    func warnDeadlock(result: [GraphNode]){
        if var lastIndex = result.lastIndex(where: {$0.id == result[0].id}) {
            if lastIndex != 0 {
                self.deadlockFound = true
            }
       }

    }
    
    func OSRoutine() {
        Timer.scheduledTimer(withTimeInterval: TimeInterval(timeInterval), repeats: true) { [self] timer in
            var res = dfs(root: processes.randomElement())
            print(res.map{$0.id.description.prefix(4)})
            warnDeadlock(result: res)

            processes.forEach { element in
                element.isVisited = false
            }
            resources.forEach { element in
                element.isVisited = false
            }

        }

        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
            timeRemaining -= 1
            if timeRemaining <= 0 {
                timeRemaining = timeInterval
            }
        }
    }
    
    func updateView() {
        DispatchQueue.main.async{
            self.processes = self.processes.map{$0}
            self.resources = self.resources.map{$0}
        }
        
    }
    
}
