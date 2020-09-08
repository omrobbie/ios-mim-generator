//
//  DetailsVC.swift
//  MimGenerator
//
//  Created by omrobbie on 08/09/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsVC: UIViewController {

    @IBOutlet weak var imgMeme: UIImageView!

    var urlString: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()
    }

    private func setupImage() {
        guard let url = URL(string: urlString) else {return}
        imgMeme.kf.indicatorType = .activity
        imgMeme.kf.setImage(with: url, placeholder: UIImage(systemName: "photo.on.rectangle.angled"))
    }

    @IBAction func btnAddLogoTappde(_ sender: Any) {
    }

    @IBAction func btnAddTextTapped(_ sender: Any) {
    }
}
