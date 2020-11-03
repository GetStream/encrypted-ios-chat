//
//  exportPublicKey.swift
//  EncryptedChat
//
//  Created by Matheus Cardoso on 27/10/20.
//

import CryptoKit

func exportPublicKey(_ publicKey: P256.KeyAgreement.PublicKey) -> String {
    let rawPublicKey = publicKey.rawRepresentation
    let base64PublicKey = rawPublicKey.base64EncodedString()
    let encodedPublicKey = base64PublicKey.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
    return encodedPublicKey
}
