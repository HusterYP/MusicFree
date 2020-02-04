//
//  LoginViewController.swift
//  MusicFree
//
//  Created by 袁平 on 2020/1/30.
//  Copyright © 2020 袁平. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    private let layout = Layout()
    private let disposeBag = DisposeBag()
    private let viewModel: LoginViewModel

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var nameInput: NameInputView = {
        let nameInput = NameInputView()
        nameInput.layer.borderColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        nameInput.layer.borderWidth = 1 / UIScreen.main.scale
        nameInput.layer.cornerRadius = layout.inputH / 2
        return nameInput
    }()

    private lazy var pwdInput: PasswordInputView = {
        let pwdInput = PasswordInputView()
        pwdInput.layer.borderColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        pwdInput.layer.borderWidth = 1 / UIScreen.main.scale
        pwdInput.layer.cornerRadius = layout.inputH / 2
        return pwdInput
    }()

    private lazy var topIcon: UIImageView = {
        let icon = UIImageView(image: ImageResource.music_top)
        icon.clipsToBounds = true
        icon.contentMode = .scaleToFill
        icon.layer.borderColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        icon.layer.borderWidth = 1 / UIScreen.main.scale
        icon.layer.cornerRadius = layout.topIconSize / 2
        return icon
    }()

    private lazy var confirmView: UIImageView = {
        let imageView = UIImageView(image: ImageResource.arrow_right)
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .center
        imageView.layer.borderColor = UIColor.gray.withAlphaComponent(0.1).cgColor
        imageView.layer.borderWidth = 1 / UIScreen.main.scale
        imageView.layer.cornerRadius = layout.confirmSize / 2
        imageView.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupModel()
    }

    private func setupViews() {
        view.backgroundColor = .white
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(rootViewTap))
        view.addGestureRecognizer(recognizer)
        view.addSubview(topIcon)
        topIcon.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(layout.topIconSize)
        }

        view.addSubview(nameInput)
        nameInput.snp.makeConstraints { (make) in
            make.top.equalTo(topIcon.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
            make.height.equalTo(layout.inputH)
            make.width.equalToSuperview().multipliedBy(0.68)
        }

        view.addSubview(pwdInput)
        pwdInput.snp.makeConstraints { (make) in
            make.top.equalTo(nameInput.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(layout.inputH)
            make.width.equalToSuperview().multipliedBy(0.68)
        }

        view.addSubview(confirmView)
        confirmView.snp.makeConstraints { (make) in
            make.top.equalTo(pwdInput.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(layout.confirmSize)
        }
    }

    private func setupModel() {
        nameInput.inputTF.rx.text.asDriver().distinctUntilChanged().drive(onNext: { (name) in
        }).disposed(by: disposeBag)
        pwdInput.inputTF.rx.text.asDriver().distinctUntilChanged().drive(onNext: { (pwd) in
        }).disposed(by: disposeBag)
    }
}

// MARK: Click
extension LoginViewController {
    @objc
    private func rootViewTap() {
        view.endEditing(true)
    }
}

// MARK: Const
extension LoginViewController {
    struct Layout {
        let inputH: CGFloat = 68
        let topIconSize: CGFloat = 88
        let iconSize: CGFloat = 28
        let confirmSize: CGFloat = 88
    }
}
