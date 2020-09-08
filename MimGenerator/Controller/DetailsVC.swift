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
    @IBOutlet weak var imgLogo: UIImageView!
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
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.delegate = self
        imagePickerVC.allowsEditing = true
        present(imagePickerVC, animated: true)
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

    @IBAction func btnSaveTapped(_ sender: Any) {
        let alertVC = UIAlertController(title: "Save this meme?", message: nil, preferredStyle: .alert)

        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        let actionSave = UIAlertAction(title: "Save", style: .default) { (_) in

        }

        alertVC.addAction(actionCancel)
        alertVC.addAction(actionSave)

        present(alertVC, animated: true)
    }
}

extension DetailsVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        dismiss(animated: true)
        imgLogo.image = image
    }
}
