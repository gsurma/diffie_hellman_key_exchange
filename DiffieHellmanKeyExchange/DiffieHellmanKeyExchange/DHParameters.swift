//
//  DHParameters.swift
//  DiffieHellmanKeyExchange
//
//  Created by Grzegorz Surma on 07/04/2018.
//  Copyright © 2018 Grzegorz Surma. All rights reserved.
//

import Foundation

struct DHDefaultParameters {
    static let p = 23
    static let g = 5
}

struct DHParameters {
    var p: Int = DHDefaultParameters.p // p = safe prime
    var g: Int = DHDefaultParameters.g // g = primitive root modulo of p
    
    init() {
        var _p: Int = 0
        var _q: Int = 0
        
        // We choose p so that p=2q+1, where q is also prime
        while !_p.isPrime() {
            _q = Int().generateRandomPrime()
            _p = (2 * _q) + 1
        }
        p = _p
        
        // Than we look for the smallest possible x until x,x2,xk≢1(modp)
        for x in 1...p where
                x % p != 1
                && (x^^2) % p != 1
                && (x^^_q) % p != 1 {
                    g = x
                    break
        }
        print("Generated DHParameters. P is \(p) (safe prime) and g is \(g) (primitive root modulo of modulus) \n")
    }
}
