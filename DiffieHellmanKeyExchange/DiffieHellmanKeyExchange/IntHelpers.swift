//
//  IntHelpers.swift
//  DiffieHellmanKeyExchange
//
//  Created by Grzegorz Surma on 08/04/2018.
//  Copyright © 2018 Grzegorz Surma. All rights reserved.
//

import Foundation

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^ : PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}

extension Int {
    
    func isPrime() -> Bool {
        return self > 1 && !(2 ..< self).contains { self % $0 == 0 }
    }
    
    func generateRandomPrime(upperBound: Int = 50) -> Int {
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
}
