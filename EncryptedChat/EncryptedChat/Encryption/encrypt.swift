//
//  encrypt.swift
//  EncryptedChat
//
//  Created by Matheus Cardoso on 27/10/20.
//

import Foundation
import CryptoKit

func encrypt(text: String, symmetricKey: SymmetricKey) throws -> String {
    let textData = text.data(using: .utf8)!
    let encrypted = try AES.GCM.seal(textData, using: symmetricKey)
    return encrypted.combined!.base64EncodedString()
}
