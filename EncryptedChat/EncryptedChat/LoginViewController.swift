//
//  LoginViewController.swift
//  EncryptedChat
//
//  Created by Matheus Cardoso on 26/10/20.
//

import UIKit
import CryptoKit
import StreamChat
import StreamChatCore
import StreamChatClient

public class LoginViewController: UITableViewController {
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var senderTextField: UITextField!
    @IBOutlet weak var privateKeyTextField: UITextField!
    @IBOutlet weak var recipientTextField: UITextField!
    
    var senderId: String { senderTextField.text ?? "" }
    var privateKey: String { privateKeyTextField.text ?? "" }
    var recipientId: String { recipientTextField.text ?? "" }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func donePressed(_ sender: Any) {
        guard let privateKey = try? importPrivateKey(self.privateKey) else {
            return self.alert(title: "Error", message: "Could not import private key")
        }
 
        let publicKey = privateKey.publicKey
        
        setUser(userId: senderId, publicKey: publicKey) { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.presentEncryptedChat(with: self.recipientId, privateKey: privateKey)
                case let .failure(error):
                    self.alert(title: "Error", message: error.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func generatePrivateKeyPressed(_ sender: Any) {
        let privateKey = generatePrivateKey()
        let exportedPrivateKey = exportPrivateKey(privateKey)
        privateKeyTextField.text = exportedPrivateKey
        textFieldChanged(privateKeyTextField!)
    }

    @IBAction func textFieldChanged(_ textField: Any) {
        if !senderId.isEmpty && !privateKey.isEmpty && !recipientId.isEmpty {
            doneButton.isEnabled = true
        } else {
            doneButton.isEnabled = false
        }
    }
}
