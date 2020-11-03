//
//  generatePrivateKey.swift
//  EncryptedChat
//
//  Created by Matheus Cardoso on 27/10/20.
//

import CryptoKit

func generatePrivateKey() -> P256.KeyAgreement.PrivateKey {
    let privateKey = P256.KeyAgreement.PrivateKey()
    return privateKey
}
