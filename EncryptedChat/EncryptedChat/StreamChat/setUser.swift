//
//  setUser.swift
//  EncryptedChat
//
//  Created by Matheus Cardoso on 02/11/20.
//

import Foundation
import CryptoKit
import StreamChatClient

func setUser(userId: String, publicKey: P256.KeyAgreement.PublicKey, completion: @escaping (Result<UserConnection, ClientError>) -> Void) {
    let exportedPublicKey = exportPublicKey(publicKey)
    
    let extraData = PublicKeyExtraData(
        name: userId,
        avatarURL: URL(string: "https://getstream.io/random_png/?id=\(userId)&name=\(userId)"),
        publicKey: exportedPublicKey
    )
    
    let sender = User(id: userId, extraData: extraData)
    
    Client.shared.set(user: sender, token: .development, completion)
}
