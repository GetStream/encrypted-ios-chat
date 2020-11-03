//
//  importPublicKey.swift
//  EncryptedChat
//
//  Created by Matheus Cardoso on 28/10/20.
//

import Foundation
import CryptoKit

func importPublicKey(_ publicKey: String) throws -> P256.KeyAgreement.PublicKey {
    let base64PublicKey = publicKey.removingPercentEncoding!
    let rawPublicKey = Data(base64Encoded: base64PublicKey)!
    let publicKey = try P256.KeyAgreement.PublicKey(rawRepresentation: rawPublicKey)
    return publicKey
}
