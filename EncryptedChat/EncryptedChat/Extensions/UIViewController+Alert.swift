//
//  UIViewController+Alert.swift
//  EncryptedChat
//
//  Created by Matheus Cardoso on 27/10/20.
//

import UIKit

extension UIViewController {
    func alert(title: String, message: String, completion: @escaping () -> Void = {}) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        controller.addAction(.init(title: "OK", style: .default, handler: { _ in completion() }))
        self.present(controller, animated: true)
    }
}
