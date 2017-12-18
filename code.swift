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
        var match2: [String] = []
        var Dfa: [(t1:[String], Str:String, t2:[String])] = []
        var tr1=[String]()
        tr1.append("a")
        

        for i in 0...transTab.count-1{
            if (marked[i]==false){
               marked[i]=true
               match1.append(transTab[i][2])
               for j in 0...transTab.count-1{
                      if (transTab[i][0]==transTab[j][0] && transTab[i][1]==transTab[j][1] && marked [j] == false){
                       match1.append(transTab[j][2])
                       marked[j]=true
                      }
               }
                
               match1=match1.sorted()
               tr1[0]=transTab[i][0]
               Dfa += [(t1:tr1, Str:transTab[i][1], t2:match1)]
               match1=[]

            }
        }
        
        
        func passage(){
            for i in 0...Dfa.count{
            if(Dfa[i].t2.count>1){
                    for j in 0...Dfa.count-1{
                            if( Dfa[i].t2==Dfa[j].t1){
                                    break
                            }
                            else {
                                    for trans in self.values{
                                            for elem in Dfa[i].t2{
                                                    for z in 0...Dfa.count-1{
                                                            if (elem == Dfa[z].t1[0] && trans == Dfa[z].Str){
                                                                    for e in 0...Dfa[z].t2.count-1{
                                                                        if (!(match2.contains(Dfa[z].t2[e]))) {
                                                                        match2.append(Dfa[z].t2[e])
                                                                        }
                                                                    }
                                                            }
                                                    }
                                            }
                                        Dfa.append((t1:Dfa[i].t2, Str:trans, t2:match2))
                                        match2=[]  
                                    }
                            }
                        break   
                    }
            }
        }
        }
        passage ()
        for q in 0...Dfa.count-1{
         print(Dfa[q])   
        }
        
      
    }
}

let automate = Automate(nodes: ["0", "1", "2","3"], values: ["a", "b"], firstState: "1", finalStates: ["3"])
automate.addTransition(fstate:"0",value:"a",lstate:"0")
automate.addTransition(fstate:"0",value:"a",lstate:"1")
automate.addTransition(fstate:"0",value:"b",lstate:"1")
automate.addTransition(fstate:"1",value:"a",lstate:"2")
automate.addTransition(fstate:"2",value:"b",lstate:"3")


automate.test()
automate.Nfa2Dfa()
