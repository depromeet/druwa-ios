//
//  MainListViewController.swift
//  Druwa
//
//  Created by leeyang on 20/02/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit

class MainListViewController: BaseViewController {

    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var navigationTitle: String = ""

    var verticalFlowlayout: UICollectionViewFlowLayout = {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 8.0
        flowLayout.minimumLineSpacing = 16.0
        flowLayout.itemSize = CGSize(width: 100, height: 134)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        flowLayout.scrollDirection = .vertical
        return flowLayout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUpUI() {
        super.setUpUI()
        collectionView.backgroundColor = .gray400
        collectionView.collectionViewLayout = verticalFlowlayout
        collectionView.register(UINib(nibName: String(describing: EpisodeCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: EpisodeCollectionViewCell.self))
        navigationBar.configurationLeftButton(image: "iconBack", target: self)
        navigationBar.configurationRightButton(image: "iconSearch", target: self, isSelectedColor: .gray0)
        navigationBar.configurationTitle(title: navigationTitle, size: 17.0, color: .gray0)
    }
    
    @objc func pressedLeftButton(sender: UIButton) {
          print("click")
        navigationController?.popViewController(animated: true)
    }
      
    @objc func pressedRightButton(sender: UIButton) {
        print("click2")
    }
    
    @objc func pressdeDetailDrama(sender: UIButton) {
        print("pressdeDetailDrama")
    }
}

extension MainListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: EpisodeCollectionViewCell.self), for: indexPath as IndexPath) as? EpisodeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configuationInit(product: "모두의필름", drama: "당신은동화를믿나요", imageURL: "https://druwa-repository-test.s3.ap-northeast-2.amazonaws.com/1234-1579626544607-446289.jpg")
        return cell
    }
    
}

extension MainListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - (16 * 3)
        return CGSize(width: width / 2, height: 152)
    }
}
