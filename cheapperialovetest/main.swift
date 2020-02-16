//
//  main.swift
//  cheapperialovetest
//
//  Created by Francesco Mattiussi on 16/02/2020.
//  Copyright © 2020 Francesco Mattiussi. All rights reserved.
//

import Foundation

let tu = "francesco"

let crush = "borraxcx"

var numeri: [Int] = []

for i in tu + crush {
    
    var corrispondenze = 0
    
    for j in tu + crush {
        
        if i == j {
            
            corrispondenze += 1
        }
    }
    
    numeri.append(corrispondenze)
    
    corrispondenze = 0
}

print(numeri)

while numeri.count >= 3 && numeri[numeri.count - 1] != 0 {
    
    var temp: [Int] = []
    
    while numeri.count >= 2 {
        
        if numeri[0] + numeri[numeri.count - 1] > 9 {
            
            let cifreA = String(numeri[0] + numeri[numeri.count - 1]).map { Int(String($0))! }
            
            temp.append(contentsOf: cifreA)
            
            
        } else {
            
            temp.append(numeri[0] + numeri[numeri.count - 1])
        }
        
        numeri.remove(at: 0)
        numeri.remove(at: numeri.count - 1)
        
    }
    
    if numeri.count != 0 {
        let extra = numeri[0]
        numeri = temp
        numeri.append(extra)
    } else {
        numeri = temp
    }
    
    print(numeri)
    
}

var percentuale = ""
_ = numeri.map{ percentuale = percentuale + "\($0)" }

print("❤️ sei compatibile al " + percentuale + "% con " + crush + " ❤️")


