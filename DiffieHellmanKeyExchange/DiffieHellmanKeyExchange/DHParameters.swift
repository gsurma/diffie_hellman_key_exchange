//
//  DHParameters.swift
//  DiffieHellmanKeyExchange
//
//  Created by Grzegorz Surma on 07/04/2018.
//  Copyright © 2018 Grzegorz Surma. All rights reserved.
//

import Foundation

struct DHDefaultParameters {
    static let modulus = 23
    static let base = 5
}

struct DHParameters {
    var modulus: Int = DHDefaultParameters.modulus // p = safe prime
    var base: Int = DHDefaultParameters.base // g = primitive root modulo of p
    
    init() {
        var p: Int = 0
        var q: Int = 0
        
        // We choose p so that p=2q+1, where q is also prime
        while !p.isPrime() {
            q = Int().generateRandomPrime()
            p = (2 * q) + 1
        }
        modulus = p
        
        // Than we look for the smallest possible x until x,x2,xk≢1(modp)
        for x in 1...p where
                x % p != 1
                && (x^^2) % p != 1
                && (x^^q) % p != 1 {
                    base = x
                    break
        }
        print("Generated DHParameters. Modulus is \(modulus) (safe prime) and base is \(base) (primitive root modulo of modulus) \n")
    }
}
