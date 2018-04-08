//
//  DHParameters.swift
//  DiffieHellmanKeyExchange
//
//  Created by Grzegorz Surma on 07/04/2018.
//  Copyright © 2018 Grzegorz Surma. All rights reserved.
//

import Foundation

struct DHParameters {
    var modulus: Int = 23 // p = prime
    var base: Int = 5 // g = primitive root modulo of p
    
    init() {
        var p: Int = 0
        var q: Int = 0
        while !isPrime(p) {
            q = generateRandomPrime()
            p = (2 * q) + 1
        }
        modulus = p
        
        for x in 1...p where
                x % p != 1
                && (x^^2) % p != 1
                && (x^^q) % p != 1 {
                    base = x
                    break
        }
    }
    
    private func generateRandomPrime(upperBound: Int = 50) -> Int {
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

    func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
}

