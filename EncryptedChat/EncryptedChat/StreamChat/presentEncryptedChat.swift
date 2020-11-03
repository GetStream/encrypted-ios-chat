//
//  getPublicKey.swift
//  EncryptedChat
//
//  Created by Matheus Cardoso on 02/11/20.
//

import Foundation
import CryptoKit
import StreamChatClient
import StreamChatCore
import UIKit

extension UIViewController {
    func presentEncryptedChat(with userId: String, privateKey: P256.KeyAgreement.PrivateKey) {
        Client.shared.queryUsers(filter: .equal("id", to: userId)) { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(users):
                    guard
                        let user = users.first,
                        let publicKey = (user.extraData as? PublicKeyExtraData)?.publicKey
                    else {
                        return self.alert(title: "Error", message: "The recipient was not found or doesn't have a public key.")
                    }
                    
                    do {
                        let importedPublicKey = try importPublicKey(publicKey)
                        let derivedKey = try deriveSymmetricKey(privateKey: privateKey, publicKey: importedPublicKey)
                        
                        let chatViewController = EncryptedChatViewController()
                        chatViewController.symmetricKey = derivedKey
                        chatViewController.presenter = ChannelPresenter(channel: Client.shared.channel(members: [Client.shared.user, user]))
                        
                        self.navigationController?.pushViewController(chatViewController, animated: true)
                    } catch let error {
                        self.alert(title: "Error", message: error.localizedDescription)
                    }
                case let .failure(error):
                    self.alert(title: "Error", message: error.localizedDescription)
                }
            }
        }
    }
}
