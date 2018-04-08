//
//  main.swift
//  DiffieHellmanKeyExchange
//
//  Created by Grzegorz Surma on 07/04/2018.
//  Copyright © 2018 Grzegorz Surma. All rights reserved.
//
import Foundation

let commonPublicComponent = DHParameters()

let alice = Person(commonPublicComponent: commonPublicComponent)
let bob = Person(commonPublicComponent: commonPublicComponent)

print("Alice and Bob agrees to use common public component: \(commonPublicComponent) \n")

let alicePublicKey = alice.generatePublicKey()
print("Alice generated public key: \(alicePublicKey)")

let bobPublicKey = bob.generatePublicKey()
print("Bob generated public key: \(bobPublicKey) \n")

let aliceComputedCommonSecretKey = alice.computeComputeCommonSecretKey(peerKey: bobPublicKey)
print("Alice computed common secret key: \(aliceComputedCommonSecretKey)")

let bobComputedCommonSecretKey = bob.computeComputeCommonSecretKey(peerKey: alicePublicKey)
print("Bob computed common secret key: \(bobComputedCommonSecretKey) \n")

print("Alice's and Bob's computed secret keys are the same: \(aliceComputedCommonSecretKey == bobComputedCommonSecretKey) \n")
