//
//  importPrivateKey.swift
//  EncryptedChat
//
//  Created by Matheus Cardoso on 27/10/20.
//

import Foundation
import CryptoKit

func importPrivateKey(_ privateKey: String) throws -> P256.KeyAgreement.PrivateKey {
    let privateKeyBase64 = privateKey.removingPercentEncoding!
    let rawPrivateKey = Data(base64Encoded: privateKeyBase64)!
    return try P256.KeyAgreement.PrivateKey(rawRepresentation: rawPrivateKey)
}
