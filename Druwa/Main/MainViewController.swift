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
    
    var firstDramas: [CurationModel]?
    var secondDramas: [CurationModel]?
    var thirdDramas: [CurationModel]?
    var fourthDramas: [CurationModel]?
    
    let service: DramaService = DramaService()
    
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
        configuartionDataList()
    }
    
    override func setUpUI() {
        super.setUpUI()
        tableView.backgroundColor = .gray400
        tableView.separatorColor = .clear
        tableView.register(UINib(nibName: String(describing: MainTopCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MainTopCell.self))
        tableView.register(UINib(nibName: String(describing: EpisodeTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: EpisodeTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: PostTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: HeaderViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: HeaderViewCell.self))
        tableView.register(UINib(nibName: String(describing: FooterViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FooterViewCell.self))
        
        navigationBar.configurationLeftButton(image: "iconAlarm", target: self)
        navigationBar.configurationRightButton(image: "iconSearch", target: self, isSelectedColor: .gray0)
        navigationBar.configurationTitle(title: "Druwa", size: 17.0, color: .gray0)
    }
    
    private func configuartionDataList() {
        service.getCurationList(index: 1) { modelList in
            self.firstDramas = modelList
            self.tableView.reloadData()
        }
        service.getCurationList(index: 2) { modelList in
            self.secondDramas = modelList
            self.tableView.reloadData()
        }
        service.getCurationList(index: 3) { modelList in
            self.thirdDramas = modelList
            self.tableView.reloadData()
        }
        service.getCurationList(index: 4) { modelList in
            self.fourthDramas = modelList
            self.tableView.reloadData()
        }
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
    
    @objc func pressedFooter(sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainListViewController = storyBoard.instantiateViewController(withIdentifier: "MainListViewController") as! MainListViewController
        
        switch sender.tag {
        case 1:
            mainListViewController.navigationTitle = "1월 인기 베스트 드라마 전체보기"
        case 3:
            mainListViewController.navigationTitle = "최신 업데이트 전체보기"
        case 4:
            mainListViewController.navigationTitle = "스릴러 장르 전체보기"
        default:
            break
        }
        navigationController?.pushViewController(mainListViewController, animated: true)
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
            return 58
        case (2,0):
            return 43
        case (2,1):
            return 183
        case (3...4,0):
            return 43
        case (3...4,1):
            return 320
        case (3...4,2):
            return 58
        default:
            return 0
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1,3,4:
            return 3
        case 2:
            return 2
        default:
            return 0
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
            cell.backgroundColor = .gray400
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            cell.collectionView.register(UINib(nibName: String(describing: MainTopCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MainTopCollectionViewCell.self))
            cell.collectionView.tag = cell.collectionView.hashValue
            cell.collectionView.collectionViewLayout = horizenFlowlayout
            cell.collectionView.isPagingEnabled = true
            cell.collectionView.bounces = false
            tagDictionary.updateValue(section, forKey: cell.collectionView.tag)
            cell.selectionStyle = .none
            return cell
        case 1:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderViewCell.self), for: indexPath) as? HeaderViewCell else {
                    return UITableViewCell()
                }
                cell.backgroundColor = .gray400
                cell.titleLabel.text = "1"
                cell.titleLabel.backgroundColor = .clear
                cell.titleLabel.font = .boldSystemFont(ofSize: 16.0)
                cell.titleLabel.textColor = .gray0
                let attributeString = NSMutableAttributedString(string: "1월 인기 BEST 드라마")
                attributeString.setColorForText("BEST", with: .main400)
                cell.titleLabel.attributedText = attributeString
                cell.selectionStyle = .none
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EpisodeTableViewCell.self), for: indexPath) as? EpisodeTableViewCell else {
                    return UITableViewCell()
                }
                 cell.backgroundColor = .gray400
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
                cell.backgroundColor = .gray400
                cell.footerButton.setTitle("1월 인기 베스트 드라마 전체보기", for: .normal)
                cell.selectionStyle = .none
                cell.footerButton.tag = section
                cell.footerButton.addTarget(self, action: #selector(pressedFooter), for: .touchUpInside)
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
                cell.backgroundColor = .gray400
                cell.titleLabel.text = "1"
                cell.titleLabel.backgroundColor = .clear
                cell.titleLabel.font = .boldSystemFont(ofSize: 16.0)
                cell.titleLabel.textColor = .gray0
                let attributeString = NSMutableAttributedString(string: "리뷰 TOP 화제의 인기작")
                attributeString.setColorForText("인기작", with: .main400)
                cell.titleLabel.attributedText = attributeString
                cell.selectionStyle = .none
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as? PostTableViewCell else {
                    return UITableViewCell()
                }
                cell.backgroundColor = .gray400
                cell.dramaButton.addTarget(self, action: #selector(pressdeDetailDrama), for: .touchUpInside)
                cell.selectionStyle = .none
                cell.configurationInit(imageURL: secondDramas?.first?.images?.first?.imageUrl ?? "",
                                       productName: secondDramas?.first?.productionCompany ?? "",
                                       dramaName:  secondDramas?.first?.title ?? "",
                                       like: "\(secondDramas?.first?.like ?? 0)",
                                       summary: secondDramas?.first?.summary ?? "",
                                       buttonName: "드라마 보러가기")
                return cell
            default:
                  return UITableViewCell()
              }
        case 3:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeaderViewCell.self), for: indexPath) as? HeaderViewCell else {
                    return UITableViewCell()
                }
                cell.backgroundColor = .gray400
                cell.titleLabel.text = "1"
                cell.titleLabel.backgroundColor = .clear
                cell.titleLabel.font = .boldSystemFont(ofSize: 16.0)
                cell.titleLabel.textColor = .gray0
                cell.titleLabel.text = "최신 업데이트"
                cell.selectionStyle = .none
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EpisodeTableViewCell.self), for: indexPath) as? EpisodeTableViewCell else {
                    return UITableViewCell()
                }
                cell.backgroundColor = .gray400
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
                cell.backgroundColor = .gray400
                cell.configurationButtonTitle(title: "최신 업데이트 전체보기")
                cell.footerButton.tag = section
                cell.footerButton.addTarget(self, action: #selector(pressedFooter), for: .touchUpInside)
                cell.selectionStyle = .none
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
               cell.backgroundColor = .gray400
               cell.titleLabel.text = "1"
               cell.titleLabel.backgroundColor = .clear
               cell.titleLabel.font = .boldSystemFont(ofSize: 16.0)
               cell.titleLabel.textColor = .gray0
               cell.titleLabel.text = "스릴러 인기 드라마"
               cell.selectionStyle = .none
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
               cell.backgroundColor = .gray400
               cell.configurationButtonTitle(title: "스릴러 장르 전체보기")
               cell.footerButton.tag = section
               cell.footerButton.addTarget(self, action: #selector(pressedFooter), for: .touchUpInside)
               cell.selectionStyle = .none
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
                cell.selectionStyle = .none
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
//            cell.configurationInit(imageURL: secondDramas?.first?.images?.first?.imageUrl ?? "",
//                                          productName: secondDramas?.first?.productionCompany ?? "",
//                                          dramaName:  secondDramas?.first?.title ?? "",
//                                          like: "\(secondDramas?.first?.like ?? 0)",
//                                          summary: secondDramas?.first?.summary ?? "",
//                                          buttonName: "드라마 보러가기")
            let data = firstDramas?[indexPath.row]
            cell.imageView.kf.setImage(with: URL(string: data?.images?.first?.imageUrl ?? ""))
            cell.episodeName.text = "Episode 1 ~ 12"
            cell.genreName.text = data?.tag?.first
            cell.producitonName.text = data?.productionCompany ?? ""
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: EpisodeCollectionViewCell.self), for: indexPath as IndexPath) as? EpisodeCollectionViewCell else {
                return UICollectionViewCell()
            }
            let data = secondDramas?[indexPath.row]
            cell.imageVIew.kf.setImage(with: URL(string: data?.images?.first?.imageUrl ?? ""))
            cell.productionName.text = data?.productionCompany ?? ""
            cell.dramaName.text = data?.title ?? ""
            cell.layer.cornerRadius = 8.0
            return cell
        case 3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: EpisodeCollectionViewCell.self), for: indexPath as IndexPath) as? EpisodeCollectionViewCell else {
                return UICollectionViewCell()
            }
            let data = thirdDramas?[indexPath.row]
            cell.imageVIew.kf.setImage(with: URL(string: data?.images?.first?.imageUrl ?? ""))
            cell.productionName.text = data?.productionCompany ?? ""
            cell.dramaName.text = data?.title ?? ""
            cell.layer.cornerRadius = 8.0
            return cell
        case 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: EpisodeCollectionViewCell.self), for: indexPath as IndexPath) as? EpisodeCollectionViewCell else {
                return UICollectionViewCell()
            }
            let data = fourthDramas?[indexPath.row]
            cell.imageVIew.kf.setImage(with: URL(string: data?.images?.first?.imageUrl ?? ""))
            cell.productionName.text = data?.productionCompany ?? ""
            cell.dramaName.text = data?.title ?? ""
            cell.layer.cornerRadius = 8.0
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = tagDictionary[collectionView.tag]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        
        switch section {
        case 0:
            detailViewController?.dramaId = firstDramas?[indexPath.row].dramaId ?? 0
        case 1:
            detailViewController?.dramaId = secondDramas?[indexPath.row].dramaId ?? 0
        case 3:
            detailViewController?.dramaId = thirdDramas?[indexPath.row].dramaId ?? 0
        case 4:
            detailViewController?.dramaId = fourthDramas?[indexPath.row].dramaId ?? 0
        default:
            break
        }
        navigationController?.pushViewController(detailViewController!, animated: true)
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
