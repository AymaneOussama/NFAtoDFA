public class Automate {
    
    public let nodes: [String]
    public let values: [String]
    public var transTab: [[String]]
    public let firstState: String
    public let finalStates: [String]
    public var marked: [Bool]
    
    init (nodes: [String], values: [String], firstState: String, finalStates: [String]) {
        self.nodes = nodes
        self.values = values
        self.firstState = firstState
        self.finalStates = finalStates
        self.transTab = []
        self.marked = []
    }
    
    public func test () {
        print()
    }
    
    public func addTransition (fstate: String, value: String, lstate: String) {
        transTab.append([fstate,value,lstate])
        marked.append(false)
    }
    
    public func Nfa2Dfa () {
        var match1: [String] = []
        var Dfa: [(t1:[String], Str:String, t2:[String])] = []
        var t1r: [String] = []
        var exists: [[String]] = []
        
        for i in 0...transTab.count-1 {
            if marked[i]==false {
                marked[i] = true
                match1.append(transTab[0][2])
                for j in 0...transTab.count-1{
                       if (transTab[i][0]==transTab[j][0] && transTab[i][1]==transTab[j][1] && marked [j] == false) {
                           match1.append(transTab[j][2])
                           marked[j] = true
                       }
                }
               
                t1r.append(transTab[i][0])
                Dfa += [(t1:t1r, Str:transTab[i][1], t2:match1)]
                
                
            }
        }
        print(match1)
        print (Dfa[0].t2)
    }
    
}

let automate = Automate(nodes: ["1", "2", "3", "4"], values: ["a", "b"], firstState: "1", finalStates: ["2"])
automate.addTransition(fstate:"1",value:"a",lstate:"1")
automate.addTransition(fstate:"1",value:"a",lstate:"3")
automate.addTransition(fstate:"1",value:"b",lstate:"2")
automate.addTransition(fstate:"2",value:"b",lstate:"1")
automate.addTransition(fstate:"2",value:"b",lstate:"4")
automate.addTransition(fstate:"3",value:"a",lstate:"4")
automate.addTransition(fstate:"3",value:"b",lstate:"2")
automate.addTransition(fstate:"4",value:"a",lstate:"4")
automate.addTransition(fstate:"4",value:"b",lstate:"2")
automate.test()
automate.Nfa2Dfa()
