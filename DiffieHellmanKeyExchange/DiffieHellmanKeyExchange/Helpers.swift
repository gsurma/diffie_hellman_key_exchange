//
//  Helpers.swift
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
