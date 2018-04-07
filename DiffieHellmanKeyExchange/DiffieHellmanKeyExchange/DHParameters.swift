//
//  DHParameters.swift
//  DiffieHellmanKeyExchange
//
//  Created by Grzegorz Surma on 07/04/2018.
//  Copyright © 2018 Grzegorz Surma. All rights reserved.
//

import Foundation

struct DHParameters {
    var modulus: Int = 23 // prime
    var base: Int = 5 // primitive root modulo of ^^
    
    init() {
        modulus = generateRandomPrime()
        base = getPrimitiveRootModuloFor(n: modulus)
    }
    
    private func generateRandomPrime(upperBound: Int = 100000) -> Int {
        var eratosthenesSieve = Array.init(repeating: true, count: upperBound+1)
        var primes = [Int]()
        eratosthenesSieve[0] = false
        eratosthenesSieve[1] = false
        for i in 2...upperBound where eratosthenesSieve[i] == true {
            var j = i*i
            while j <= upperBound {
                eratosthenesSieve[j] = false
                j += i
            }
            primes.append(i)
        }
        return primes[Int(arc4random_uniform(UInt32(primes.count)))]
    }
    
    private func getPrimitiveRootModuloFor(n: Int) -> Int {
        // TODO:
        return 5
    }
    
    func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
}

