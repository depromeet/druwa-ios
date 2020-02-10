//
//  DetailViewController.swift
//  Druwa
//
//  Created by leeyang on 24/01/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit
import youtube_ios_player_helper_swift


class DetailViewController: BaseViewController {

    private var playerView: PlayerView!
    
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var youtubePalyer: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var horizenFlowlayout: UICollectionViewFlowLayout = {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.itemSize = CGSize(width: 98, height: 134)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }()
    
    private var tagDictionary: [Int: Int] =  [Int: Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        youtubePalyer.load(videoId: "ie8JQLLisao")
        playerView = UINib(nibName: "PlayerView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? PlayerView
        playerView.videoId = "ie8JQLLisao"
        addPlayerView()
//        youtubePalyer.load(withVideoId: "4BCxqrhsjOw")
//        youtubePalyer.load(withVideoId: <#T##String#>)
    }
    
    private func addPlayerView(){
        youtubePalyer.addSubview(playerView)
        playerView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: youtubePalyer.frame.height)
        playerView.autoresizingMask = .flexibleWidth
    }
    
    override func setUpUI() {
        super.setUpUI()
        tableView.backgroundColor = .gray400
    
        tableView.register(UINib(nibName: String(describing: DramaListCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DramaListCell.self))
        tableView.register(UINib(nibName: String(describing: CommentCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CommentCell.self))
        tableView.register(UINib(nibName: String(describing: SubCommentCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SubCommentCell.self))
        tableView.register(UINib(nibName: String(describing: ReviewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ReviewCell.self))
        tableView.register(UINib(nibName: String(describing: PlayerCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PlayerCell.self))
        tableView.register(UINib(nibName: String(describing: HeaderViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: HeaderViewCell.self))
        tableView.register(UINib(nibName: String(describing: EpisodeTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: EpisodeTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: TabButtonCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TabButtonCell.self))
        
        navigationBar.configurationLeftButton(image: "iconBack", target: self)
        navigationBar.configurationRightButton(image: "iconBookmark", target: self)
        navigationBar.configurationTitle(title: "EP.2", size: 17.0, color: .gray0)
    }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 4 {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let section = indexPath.section
         switch section {
         case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PlayerCell.self), for: indexPath) as? PlayerCell else {
                return UITableViewCell()
            }
            return cell
         case 1:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderViewCell.self), for: indexPath) as? HeaderViewCell else {
                    return UITableViewCell()
                }
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EpisodeTableViewCell.self), for: indexPath) as? EpisodeTableViewCell else {
                    return UITableViewCell()
                }
                cell.collectionView.register(UINib(nibName: String(describing: DramaListCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: EpisodeCollectionViewCell.self))
                cell.collectionView.tag = cell.collectionView.hashValue

                tagDictionary.updateValue(section, forKey: cell.collectionView.tag)
                return cell
            default:
                return UITableViewCell()
            }
         case 2:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderViewCell.self), for: indexPath) as? HeaderViewCell else {
                    return UITableViewCell()
                }
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EpisodeTableViewCell.self), for: indexPath) as? EpisodeTableViewCell else {
                    return UITableViewCell()
                }
                cell.collectionView.register(UINib(nibName: String(describing: DramaListCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: EpisodeCollectionViewCell.self))
                cell.collectionView.tag = cell.collectionView.hashValue
                tagDictionary.updateValue(section, forKey: cell.collectionView.tag)
                return cell
            default:
                return UITableViewCell()
            }
         case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TabButtonCell.self), for: indexPath) as? TabButtonCell else {
                return UITableViewCell()
            }
             
            return cell
         case 4:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommentCell.self), for: indexPath) as? CommentCell else {
                    return UITableViewCell()
                }
                return cell
            } else if indexPath.row == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SubCommentCell.self), for: indexPath) as? SubCommentCell else {
                    return UITableViewCell()
                }
                return cell
            }
         default:
             return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let section = indexPath.section
        switch section {
        case 1,2:
            if let cell = cell as? EpisodeTableViewCell {
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                cell.collectionView.collectionViewLayout = horizenFlowlayout
                tagDictionary.updateValue(indexPath.section, forKey: cell.collectionView.tag)
                cell.selectionStyle = .none
                cell.collectionView.reloadData()
            }
        default:
            break
        }
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let section = tagDictionary[collectionView.tag]
        switch section {
            case 0:
            return 3
        default:
            return 4
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = tagDictionary[collectionView.tag]
        switch section {
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DramaListCell.self), for: indexPath as IndexPath) as?   DramaListCell else {
                return UICollectionViewCell()
            }
            cell.dramaImageView.kf.setImage(with: URL(string: "https://druwa-repository-test.s3.ap-northeast-2.amazonaws.com/1234-1579626544607-446289.jpg"))
            cell.eposideName.text = "최고의 선물 EP.3"
            cell.titleLabel.text = "밀당의 기술"
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DramaListCell.self), for: indexPath as IndexPath) as? DramaListCell else {
                return UICollectionViewCell()
            }
            cell.dramaImageView.kf.setImage(with: URL(string: "https://druwa-repository-test.s3.ap-northeast-2.amazonaws.com/1234-1579626544607-446289.jpg"))
            cell.eposideName.text = "최고의 선물 EP.3"
            cell.titleLabel.text = "밀당의 기술"
            return cell
        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = tagDictionary[collectionView.tag]
        switch section {
        case 0:
            break
        case 1:
            break
        case 3:
            break
        case 4:
            break
        default:
            break
        }
    }

}

extension DetailViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = tagDictionary[collectionView.tag]
        switch section {
            case 0:
            return CGSize(width: view.frame.width, height: 272)
        default:
            let width = view.frame.width - (16 * 3)
            return CGSize(width: width / 2, height: 152)
        }
    }
}
