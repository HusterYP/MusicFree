//
//  HomeController.swift
//  MusicFree
//
//  Created by 袁平 on 2020/1/28.
//  Copyright © 2020 袁平. All rights reserved.
//

import UIKit
import SnapKit

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: .zero)
        button.setTitle("Click To Push", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(clickToPush), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }

    @objc
    private func clickToPush() {
        let viewModel = LoginViewModel()
        let controller = LoginViewController(viewModel: viewModel)
        navigationController?.present(controller, animated: true)
    }
}
