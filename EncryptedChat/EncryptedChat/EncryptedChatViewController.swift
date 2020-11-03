//
//  EncryptedChatViewController.swift
//  EncryptedChat
//
//  Created by Matheus Cardoso on 27/10/20.
//

import StreamChat
import StreamChatClient
import CryptoKit
import UIKit

class EncryptedChatViewController: ChatViewController {
    var symmetricKey: SymmetricKey!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.messagePreparationCallback = {
            var message = $0
            
            do {
                message.text = try encrypt(text: message.text, symmetricKey: self.symmetricKey!)
            } catch let error {
                message.text = "Could not encrypt message: \(error.localizedDescription)"
            }
            
            return message
        }
    }
    
    override func messageCell(at indexPath: IndexPath, message: Message, readUsers: [User]) -> UITableViewCell {
        var message = message

        message.text = decrypt(text: message.text, symmetricKey: symmetricKey)

        return super.messageCell(at: indexPath, message: message, readUsers: readUsers)
    }
}
