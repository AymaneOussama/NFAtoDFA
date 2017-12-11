public class Automate {
    
    public let nodes: [String]
    public let values: [String]
    public var transTab: [[String]]
    public let firstState: String
    public let finalStates: [String]
    public var inc = 0
    
    
    init (nodes: [String], values: [String], firstState: String, finalStates: [String]) {
        self.nodes = nodes
        self.values = values
        self.firstState = firstState
        self.finalStates = finalStates
        self.transTab = []
    }
    
    public func test () {
    //       for i in transTab {
      //          print("\(i)")
        //}
        print("\(transTab[4][0])")
    }
    
    public func addTransition (fstate: String, value: String, lstate: String) {
        transTab.append([fstate,value,lstate])
    }
    
}

let automate = Automate(nodes: ["q0", "q1", "q2"], values: ["a", "b"], firstState: "q0", finalStates: ["q1","q2"])
automate.addTransition(fstate:"q0",value:"a",lstate:"q1")
automate.addTransition(fstate:"q0",value:"a",lstate:"q2")
automate.addTransition(fstate:"q1",value:"a",lstate:"q1")
automate.addTransition(fstate:"q1",value:"a",lstate:"q2")
automate.addTransition(fstate:"q2",value:"b",lstate:"q1")
automate.addTransition(fstate:"q2",value:"b",lstate:"q3")
automate.addTransition(fstate:"q3",value:"a",lstate:"q1")
automate.addTransition(fstate:"q3",value:"a",lstate:"q2")
automate.test()
