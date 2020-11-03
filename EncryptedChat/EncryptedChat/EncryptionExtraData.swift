//
//  EncryptionExtraData.swift
//  EncryptedChat
//
//  Created by Matheus Cardoso on 27/10/20.
//

import StreamChatClient
import Foundation

struct PrivateKeyExtraData: UserExtraDataCodable, Codable {
    var name: String?
    
    var avatarURL: URL?
    
    var privateKey: String?
}

