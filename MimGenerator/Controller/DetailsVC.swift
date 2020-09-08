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
    @IBOutlet weak var lblText: UILabel!

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
        let alertVC = UIAlertController(title: "Add Text", message: nil, preferredStyle: .alert)

        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        let actionAdd = UIAlertAction(title: "Add", style: .default) { (_) in
            if let text = alertVC.textFields?[0].text {
                self.lblText.text = text
            }
        }

        alertVC.addTextField { (textfield) in
            textfield.placeholder = "add this text to the meme..."
        }

        alertVC.addAction(actionCancel)
        alertVC.addAction(actionAdd)

        present(alertVC, animated: true)
    }
}
