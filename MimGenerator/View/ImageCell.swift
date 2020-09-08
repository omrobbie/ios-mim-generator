//
//  ImageCell.swift
//  MimGenerator
//
//  Created by omrobbie on 08/09/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit
import Kingfisher

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imgMeme: UIImageView!

    func parseData(item: MemeItem) {
        guard let url = URL(string: item.url) else {return}
        imgMeme.kf.indicatorType = .activity
        imgMeme.kf.setImage(with: url, placeholder: UIImage(systemName: "photo.on.rectangle.angled"))
    }
}
