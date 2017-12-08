// tableaux des noeuds //

let n1 = [ [[2] , [] , [4] , [1]],[[] , [3] , [] , [2,1]],[[2] , [] , [] , [3]],[[] , [] , [3] , [4,3]] ]


// // // // // // // // //

for t in n1 {
    print ("\(t)")
}



for i in n1 {
    for j in i {
        for k in j {
            print("\(k)")
        }
    }
}
