//
//  PrivateKeyExtraData.swift
//  EncryptedChat
//
//  Created by Matheus Cardoso on 27/10/20.
//

import StreamChatClient
import Foundation

struct PublicKeyExtraData: UserExtraDataCodable, Codable {
    var name: String?
    var avatarURL: URL?
    var publicKey: String?
    var test: String = "heyhey+hoho"
}

