//
//  HomeVC.swift
//  MimGenerator
//
//  Created by omrobbie on 08/09/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var imageList: UICollectionView!

    private var imageListRefreshControl: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupList()
        loadData()
    }

    private func setupList() {
        imageListRefreshControl = UIRefreshControl()
        imageListRefreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh ↓")
        imageListRefreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        imageList.addSubview(imageListRefreshControl)
    }

    @objc private func loadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.imageListRefreshControl.endRefreshing()
        }
    }
}

// MARK: - Handle imageList layout
extension HomeVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let scaleFactor = (screenWidth / 3) - 6
        return CGSize(width: scaleFactor, height: scaleFactor)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
}

// MARK: - Handle imageList data
extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemRed
        return cell
    }
}
