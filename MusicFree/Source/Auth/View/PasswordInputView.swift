//
//  PasswordInputView.swift
//  MusicFree
//
//  Created by 袁平 on 2020/2/2.
//  Copyright © 2020 袁平. All rights reserved.
//

import UIKit
import SnapKit

class PasswordInputView: LoginBaseInputView {
    private lazy var pwdEyeClose: UIImageView = {
        let image = ImageResource.eye_close.withAlignmentRectInsets(UIEdgeInsets(top: -4,
                                                                             left: -4,
                                                                             bottom: -4,
                                                                             right: -4))
        let imageView = UIImageView(image: image)
        imageView.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(hideInput))
        imageView.addGestureRecognizer(recognizer)
        imageView.isHidden = false
        return imageView
    }()

    private lazy var pwdEyeOpen: UIImageView = {
        let image = ImageResource.eye_open.withAlignmentRectInsets(UIEdgeInsets(top: -4,
                                                                             left: -4,
                                                                             bottom: -4,
                                                                             right: -4))
        let imageView = UIImageView(image: image)
        imageView.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(showInput))
        imageView.addGestureRecognizer(recognizer)
        imageView.isHidden = true
        return imageView
    }()

    override init() {
        super.init()
        inputTF.placeholder = "密码"
        inputTF.isSecureTextEntry = true
        inputTF.delegate = self

        addSubview(pwdEyeOpen)
        pwdEyeOpen.snp.makeConstraints { (make) in
            make.trailing.equalTo(inputTF.snp.leading).offset(-layout.iconSize)
            make.height.width.equalTo(layout.iconSize)
            make.centerY.equalToSuperview()
        }

        addSubview(pwdEyeClose)
        pwdEyeClose.snp.makeConstraints { (make) in
            make.trailing.equalTo(inputTF.snp.leading).offset(-layout.iconSize)
            make.height.width.equalTo(layout.iconSize)
            make.centerY.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PasswordInputView {
    @objc
    private func hideInput() {
        pwdEyeOpen.isHidden = false
        pwdEyeClose.isHidden = true
        inputTF.isSecureTextEntry = false
    }

    @objc
    private func showInput() {
        pwdEyeOpen.isHidden = true
        pwdEyeClose.isHidden = false
        inputTF.isSecureTextEntry = true
    }
}

extension PasswordInputView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updateString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        inputTF.text = updateString

        let selectedRange = NSMakeRange(range.location + string.count, 0)
        let from = textField.position(from: textField.beginningOfDocument, offset:selectedRange.location)
        let to = textField.position(from: from!, offset:selectedRange.length)
        textField.selectedTextRange = textField.textRange(from: from!, to: to!)
        textField.sendActions(for: UIControl.Event.editingChanged)
        return false
    }
}
