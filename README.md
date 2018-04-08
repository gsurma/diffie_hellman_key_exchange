# Diffie-Hellman Key Exchange

## About
Diffie-Hellman Key Exchange allow parties to jointly establish a secure private key without sharing it in any way ([Forward secrecy](https://en.wikipedia.org/wiki/Forward_secrecy)) and then use it for a symmetric key cipher. 

## How does it work?

1. Both parties agree on a common component, which consists of two natural numbers p (modulus) and g (base). They can be completely random to make this work, but in order to make the process significantly harder to break, **p should be a prime and g should be primitive root modulo of p**. Check `DHParameters.swift` for more info.
2. Than both parties generate random private keys and than compute public keys which they share with each other. Public keys are computed as follows **publicKey = g^privateKey mod p**
3. Afterwards, both parties can compute common secret key using own private key and peer's public key. They can do it using the following formula **secretKey = peerPublicKey^ownPrivateKey mod p** <br><br> Underlying math:
<br>
**(g^a mod p)^b mod p = g^ab mod p**
<br>
**(g^b mod p)^a mod p = g^ba mod p**

4. Now both parties can communicate using symmetric cryptography using jointly established private key.

<br>

<h3 align="center">
  <img src="assets/dh_illustration.png" width="400">
</h3>

## What's so special about it?

This protocol is considered secure (check disclaimer), because its relatively hard for eavesdroppers to compute a common secrete key knowing only public keys if p is big enough.


### Disclaimer
Don't use it in a production environment. Generated keys are very small thus making them easily breakable.
Use already generated [RFC primes](https://www.ietf.org/rfc/rfc3526.txt), but even them [may not be strong enough](https://arstechnica.com/information-technology/2015/10/how-the-nsa-can-break-trillions-of-encrypted-web-and-vpn-connections/).