//
//  LoginBaseInputView.swift
//  MusicFree
//
//  Created by 袁平 on 2020/2/2.
//  Copyright © 2020 袁平. All rights reserved.
//

import UIKit

class LoginBaseInputView: UIView {
    let layout = Layout()

    lazy var inputTF: UITextField = {
        let inputTF = UITextField(frame: .zero)
        inputTF.font = UIFont.systemFont(ofSize: 16)
        inputTF.textAlignment = .center
        return inputTF
    }()

    lazy var clearInput: UIImageView = {
        let image = ImageResource.close.withAlignmentRectInsets(UIEdgeInsets(top: -4,
                                                                             left: -4,
                                                                             bottom: -4,
                                                                             right: -4))
        let imageView = UIImageView(image: image)
        imageView.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(clearInputText))
        imageView.addGestureRecognizer(recognizer)
        return imageView
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        clipsToBounds = true
        addSubview(inputTF)
        inputTF.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
        }

        addSubview(clearInput)
        clearInput.snp.makeConstraints { (make) in
            make.leading.equalTo(inputTF.snp.trailing).offset(layout.iconSize)
            make.height.width.equalTo(layout.iconSize)
            make.centerY.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginBaseInputView {
    @objc
    private func clearInputText() {
        inputTF.text = ""
        // https://stackoverflow.com/questions/51330906/changing-the-text-of-a-uitextfield-does-not-trigger-the-rx-text-binder/51352816
        inputTF.sendActions(for: .valueChanged)
    }
}

extension LoginBaseInputView {
    struct Layout {
        let iconSize: CGFloat = 28
    }
}
