//
//  NameInputView.swift
//  MusicFree
//
//  Created by 袁平 on 2020/2/2.
//  Copyright © 2020 袁平. All rights reserved.
//

import UIKit
import SnapKit

class NameInputView: LoginBaseInputView {
    private lazy var nameArrow: UIImageView = {
        let image = ImageResource.arrow_down.withAlignmentRectInsets(UIEdgeInsets(top: -4,
                                                                             left: -4,
                                                                             bottom: -4,
                                                                             right: -4))
        let imageView = UIImageView(image: image)
        return imageView
    }()

    override init() {
        super.init()
        inputTF.placeholder = "用户名"
        clearInput.snp.remakeConstraints { (make) in
            make.leading.equalTo(inputTF.snp.trailing)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(layout.iconSize)
        }

        addSubview(nameArrow)
        nameArrow.snp.makeConstraints { (make) in
            make.leading.equalTo(clearInput.snp.trailing)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(layout.iconSize)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
