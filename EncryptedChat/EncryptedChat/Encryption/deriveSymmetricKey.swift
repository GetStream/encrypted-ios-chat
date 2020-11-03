//
//  deriveSymmetricKey.swift
//  EncryptedChat
//
//  Created by Matheus Cardoso on 27/10/20.
//

import Foundation
import CryptoKit

func deriveSymmetricKey(privateKey: P256.KeyAgreement.PrivateKey, publicKey: P256.KeyAgreement.PublicKey) throws -> SymmetricKey {
    let sharedSecret = try privateKey.sharedSecretFromKeyAgreement(with: publicKey)
    
    let symmetricKey = sharedSecret.hkdfDerivedSymmetricKey(
        using: SHA256.self,
        salt: "My Key Agreement Salt".data(using: .utf8)!,
        sharedInfo: Data(),
        outputByteCount: 32
    )
    
    return symmetricKey
}
