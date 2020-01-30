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
}
