//
//  Person.swift
//  DiffieHellmanKeyExchange
//
//  Created by Grzegorz Surma on 07/04/2018.
//  Copyright © 2018 Grzegorz Surma. All rights reserved.
//

import Foundation

final class Person {
    
    let commonPublicComponent: DHParameters!
    private let privateSecretKey: Int!
    
    init(commonPublicComponent: DHParameters) {
        self.commonPublicComponent = commonPublicComponent
        self.privateSecretKey = Int(arc4random_uniform(10))
    }
    
    func generatePublicKey() -> Int {
        return commonPublicComponent.base ^^ privateSecretKey % commonPublicComponent.modulus
    }
    
    func computeComputeCommonSecretKey(peerKey: Int) -> Int {
        return peerKey ^^ privateSecretKey % commonPublicComponent.modulus
    }
}
