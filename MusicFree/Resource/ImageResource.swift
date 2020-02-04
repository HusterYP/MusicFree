//
//  ImageResource.swift
//  MusicFree
//
//  Created by 袁平 on 2020/1/28.
//  Copyright © 2020 袁平. All rights reserved.
//

import UIKit

class ImageResource {
    private static func image(name: String) -> UIImage {
        return UIImage(named: name) ?? UIImage()
    }

    static let arrow_down = image(name: "arrow_down")
    static let arrow_right = image(name: "arrow_right")
    static let close = image(name: "close")
    static let eye_close = image(name: "eye_close")
    static let eye_open = image(name: "eye_open")
    static let music_top = image(name: "music_top")
}
