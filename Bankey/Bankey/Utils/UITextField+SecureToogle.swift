//
//  UITextField+SecureToogle.swift
//  Bankey
//
//  Created by Bruno Oliveira on 15/01/24.
//

import Foundation
import UIKit

let passwordToogleButton = UIButton(type: .custom)

extension UITextField {
    
    func enablePasswordToogle() {
        passwordToogleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordToogleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        passwordToogleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = passwordToogleButton
        rightViewMode = .always
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        passwordToogleButton.isSelected.toggle()
    }
}
