//
//  PasswordTextView.swift
//  Password
//
//  Created by Bruno Oliveira on 18/03/24.
//

import UIKit

class PasswordTextView: UIView, UITextFieldDelegate {
    
    let lockImageView = UIImageView(image: UIImage(systemName: "lock.fill"))
    let textFieldView = UITextField()
    let placeHolderText: String
    let eyeButton = UIButton(type: .custom)
    let dividerView = UIView()
    let errorText = UILabel()
    
    init(placeHolderText: String) {
        self.placeHolderText = placeHolderText
        
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder not been initialization")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 50)
    }
}

extension PasswordTextView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .orange
        
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.isSecureTextEntry = false
        textFieldView.placeholder = placeHolderText
        textFieldView.delegate = self
        textFieldView.keyboardType = .asciiCapable
        textFieldView.attributedPlaceholder = NSAttributedString(
            string: placeHolderText,
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel]
        )
        
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.slash.circle"), for: .selected)
        eyeButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .separator
        
        errorText.translatesAutoresizingMaskIntoConstraints = false
        errorText.textColor = .systemRed
        errorText.font = .preferredFont(forTextStyle: .footnote)
        errorText.text = "Enter your password"
        errorText.minimumScaleFactor = 0.8
        errorText.isHidden = false
    }
    
    func layout() {
        addSubview(lockImageView)
        addSubview(textFieldView)
        addSubview(eyeButton)
        addSubview(dividerView)
        addSubview(errorText)
        
        // lock
        NSLayoutConstraint.activate([
            lockImageView.centerYAnchor.constraint(equalTo: textFieldView.centerYAnchor),
            lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        // textField
        NSLayoutConstraint.activate([
            textFieldView.topAnchor.constraint(equalTo: topAnchor),
            textFieldView.leadingAnchor.constraint(equalToSystemSpacingAfter: lockImageView.trailingAnchor, multiplier: 1)
        ])
        
        // eyeButton
        NSLayoutConstraint.activate([
            eyeButton.centerYAnchor.constraint(equalTo: textFieldView.centerYAnchor),
            eyeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: textFieldView.trailingAnchor, multiplier: 1),
            eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        // dividerView
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: 4),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        // dividerView
        NSLayoutConstraint.activate([
            errorText.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 1),
            errorText.trailingAnchor.constraint(equalTo: trailingAnchor),
            errorText.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        // CHCR
        lockImageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        textFieldView.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        eyeButton.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
    }
}

extension PasswordTextView {
    @objc func togglePasswordView() {
        textFieldView.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
}
