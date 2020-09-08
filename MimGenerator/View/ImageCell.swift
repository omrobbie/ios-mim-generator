//
//  ImageCell.swift
//  MimGenerator
//
//  Created by omrobbie on 08/09/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imgMeme: UIImageView!

    func parseData(item: MemeItem) {
        // maybe use kingfisher to speed the development
        imgMeme.image = UIImage(systemName: "rays")
    }
}
