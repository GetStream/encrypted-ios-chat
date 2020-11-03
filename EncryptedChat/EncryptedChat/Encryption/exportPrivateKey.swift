//
//  exportPrivateKey.swift
//  EncryptedChat
//
//  Created by Matheus Cardoso on 02/11/20.
//

import Foundation
import CryptoKit

func exportPrivateKey(_ privateKey: P256.KeyAgreement.PrivateKey) -> String {
    let rawPrivateKey = privateKey.rawRepresentation
    let privateKeyBase64 = rawPrivateKey.base64EncodedString()
    let percentEncodedPrivateKey = privateKeyBase64.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
    return percentEncodedPrivateKey
}
