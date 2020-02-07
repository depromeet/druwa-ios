//
//  MainViewController.swift
//  Druwa
//
//  Created by leeyang on 25/12/2019.
//  Copyright © 2019 leeyang. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    var mainTopCell: MainTopCell?
    var horizenFlowlayout: UICollectionViewFlowLayout = {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.itemSize = CGSize(width: 98, height: 134)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }()
    
    var verticalFlowlayout: UICollectionViewFlowLayout = {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 8.0
        flowLayout.minimumLineSpacing = 16.0
        flowLayout.itemSize = CGSize(width: 100, height: 134)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        flowLayout.scrollDirection = .vertical
        return flowLayout
    }()
    
    private var tagDictionary: [Int: Int] =  [Int: Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUpUI() {
        super.setUpUI()
        tableView.backgroundColor = .gray400
        tableView.register(UINib(nibName: String(describing: MainTopCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MainTopCell.self))
        tableView.register(UINib(nibName: String(describing: EpisodeTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: EpisodeTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: PostTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: HeaderViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: HeaderViewCell.self))
        tableView.register(UINib(nibName: String(describing: FooterViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FooterViewCell.self))
        
        navigationBar.configurationLeftButton(image: "iconAlarm", target: self)
        navigationBar.configurationRightButton(image: "iconSearch", target: self)
        navigationBar.configurationTitle(title: "Druwa", size: 17.0, color: .gray0)
    }
    
    @objc func pressedLeftButton(sender: UIButton) {
          print("click")
    }
      
    @objc func pressedRightButton(sender: UIButton) {
        print("click2")
    }
    
    @objc func pressdeDetailDrama(sender: UIButton) {
        print("pressdeDetailDrama")
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = (indexPath.section, indexPath.row)
        switch index {
        case (0,_):
            return 272
        case (1,0):
            return 43
        case (1,1):
            return 320
        case (1,2):
            return 48
        case (2,_):
            return 183
        case (3...4,0):
            return 43
        case (3...4,1):
            return 320
        case (3...4,2):
            return 48
        default:
            return 0
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1,3,4:
            return 3
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        switch section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainTopCell.self), for: indexPath) as? MainTopCell else {
                return UITableViewCell()
            }
            mainTopCell = cell
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(UINib(nibName: String(describing: MainTopCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MainTopCollectionViewCell.self))
            cell.collectionView.tag = cell.collectionView.hashValue
            cell.collectionView.collectionViewLayout = horizenFlowlayout
            cell.collectionView.isPagingEnabled = true
            cell.collectionView.bounces = false
            tagDictionary.updateValue(section, forKey: cell.collectionView.tag)
            
            return cell
        case 1:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderViewCell.self), for: indexPath) as? HeaderViewCell else {
                    return UITableViewCell()
                }
                cell.titleLabel.text = "1"
                cell.titleLabel.backgroundColor = .clear
                cell.titleLabel.font = .boldSystemFont(ofSize: 16.0)
                cell.titleLabel.textColor = .gray0
                let attributeString = NSMutableAttributedString(string: "1월 인기 BEST 드라마")
                attributeString.setColorForText("BEST", with: .main400)
                cell.titleLabel.attributedText = attributeString
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EpisodeTableViewCell.self), for: indexPath) as? EpisodeTableViewCell else {
                    return UITableViewCell()
                }
                cell.collectionView.register(UINib(nibName: String(describing: EpisodeCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: EpisodeCollectionViewCell.self))
                cell.collectionView.tag = cell.collectionView.hashValue
                cell.collectionView.collectionViewLayout = verticalFlowlayout
                cell.selectionStyle = .none
                tagDictionary.updateValue(section, forKey: cell.collectionView.tag)
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FooterViewCell.self), for: indexPath) as? FooterViewCell else {
                    return UITableViewCell()
                }
                cell.footerButton.setTitle("", for: .normal)
                return cell
            default:
                return UITableViewCell()
            }
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as? PostTableViewCell else {
                return UITableViewCell()
            }
            cell.postImageView.kf.setImage(with: URL(string: "https://druwa-repository-test.s3.ap-northeast-2.amazonaws.com/1234-1579626544607-446289.jpg"))
            cell.productionName.text = "모두의필름"
            cell.likeCount.text = "123"
            cell.summaryLabel.text = "바다에 가기 위해 버스에 오른 소녀 한슬 그곳에서 한슬은 바다에 가기 위해 버스에 오른 소녀 한슬 그곳에서 한슬은 바다에 가기 위해 버스에 오른 소녀 한슬 그곳에서 한슬은"
            cell.dramaButton.addTarget(self, action: #selector(pressdeDetailDrama), for: .touchUpInside)
            return cell
        case 3:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderViewCell.self), for: indexPath) as? HeaderViewCell else {
                    return UITableViewCell()
                }
                cell.titleLabel.text = "1"
                cell.titleLabel.backgroundColor = .clear
                cell.titleLabel.font = .boldSystemFont(ofSize: 16.0)
                cell.titleLabel.textColor = .gray0
                let attributeString = NSMutableAttributedString(string: "리뷰 TOP 화제의 인기작")
                attributeString.setColorForText("BEST", with: .main400)
                cell.titleLabel.attributedText = attributeString
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EpisodeTableViewCell.self), for: indexPath) as? EpisodeTableViewCell else {
                    return UITableViewCell()
                }
                cell.collectionView.register(UINib(nibName: String(describing: EpisodeCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: EpisodeCollectionViewCell.self))
                cell.collectionView.tag = cell.collectionView.hashValue
                cell.collectionView.collectionViewLayout = verticalFlowlayout
                cell.selectionStyle = .none
                tagDictionary.updateValue(section, forKey: cell.collectionView.tag)
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FooterViewCell.self), for: indexPath) as? FooterViewCell else {
                   return UITableViewCell()
                }
                cell.footerButton.setTitle("", for: .normal)
                return cell
            default:
                return UITableViewCell()
            }
        case 4:
           switch indexPath.row {
           case 0:
               guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderViewCell.self), for: indexPath) as? HeaderViewCell else {
                   return UITableViewCell()
               }
               cell.titleLabel.text = "1"
               cell.titleLabel.backgroundColor = .clear
               cell.titleLabel.font = .boldSystemFont(ofSize: 16.0)
               cell.titleLabel.textColor = .gray0
               cell.titleLabel.text = ""
               return cell
           case 1:
               guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EpisodeTableViewCell.self), for: indexPath) as? EpisodeTableViewCell else {
                   return UITableViewCell()
               }
               cell.collectionView.register(UINib(nibName: String(describing: EpisodeCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: EpisodeCollectionViewCell.self))
               cell.collectionView.tag = cell.collectionView.hashValue
               cell.collectionView.collectionViewLayout = verticalFlowlayout
               cell.selectionStyle = .none
               tagDictionary.updateValue(section, forKey: cell.collectionView.tag)
               return cell
           case 2:
               guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FooterViewCell.self), for: indexPath) as? FooterViewCell else {
                  return UITableViewCell()
               }
               cell.footerButton.setTitle("스릴러 인기 드라마", for: .normal)
               return cell
           default:
               return UITableViewCell()
           }
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let section = indexPath.section
        switch section {
        case 1,3,4:
            if let cell = cell as? EpisodeTableViewCell {
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                tagDictionary.updateValue(indexPath.section, forKey: cell.collectionView.tag)
                cell.collectionView.reloadData()
            }
        default:
            break
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MainTopCollectionViewCell.self), for: indexPath as IndexPath) as? MainTopCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.imageView.kf.setImage(with: URL(string: "https://druwa-repository-test.s3.ap-northeast-2.amazonaws.com/1234-1579626544607-446289.jpg"))
            cell.episodeName.text = "Episode 1 ~ 12"
            cell.genreName.text = "SF DRAMA"
            cell.producitonName.text = "Samsung Electronics"
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: EpisodeCollectionViewCell.self), for: indexPath as IndexPath) as? EpisodeCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.imageVIew.kf.setImage(with:  URL(string: "https://druwa-repository-test.s3.ap-northeast-2.amazonaws.com/1234-1579626544607-446289.jpg"))
            cell.productionName.text = "모두의필름"
            cell.dramaName.text = "[EP.1] 당신은 동화를 믿나요"
            cell.layer.cornerRadius = 8.0
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: EpisodeCollectionViewCell.self), for: indexPath as IndexPath) as? EpisodeCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.imageVIew.kf.setImage(with:  URL(string: "https://druwa-repository-test.s3.ap-northeast-2.amazonaws.com/1234-1579626544607-446289.jpg"))
            cell.productionName.text = "모두의필름"
            cell.dramaName.text = "[EP.1] 당신은 동화를 믿나요"
            cell.layer.cornerRadius = 8.0
            return cell
        case 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: EpisodeCollectionViewCell.self), for: indexPath as IndexPath) as? EpisodeCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.imageVIew.kf.setImage(with:  URL(string: "https://druwa-repository-test.s3.ap-northeast-2.amazonaws.com/1234-1579626544607-446289.jpg"))
            cell.productionName.text = "모두의필름"
            cell.dramaName.text = "[EP.1] 당신은 동화를 믿나요"
            cell.layer.cornerRadius = 8.0
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
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.view.frame.width)
        mainTopCell!.changeCurrentPage(page)
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
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
