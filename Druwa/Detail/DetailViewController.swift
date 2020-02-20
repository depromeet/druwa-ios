//
//  DetailViewController.swift
//  Druwa
//
//  Created by leeyang on 24/01/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit
import youtube_ios_player_helper_swift
import TTADataPickerView
import Toast_Swift


class DetailViewController: BaseViewController {

    private var playerView: PlayerView!
    private var isComment: Bool = true
    @IBOutlet weak var bottomHeightConstraint: NSLayoutConstraint!
    
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
        playerView = UINib(nibName: "PlayerView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? PlayerView
        playerView.videoId = "ie8JQLLisao"
        addPlayerView()
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
        navigationBar.configurationTitleButton(title: "EP.2", size: 17.0, color: .gray0, image: "iconDropdownDown", target: self)
    }
    
    @objc func pressedLeftButton(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
      
    @objc func pressedRightButton(sender: UIButton) {
        // create a new style
        var style = ToastStyle()

        // this is just one of many style options
        style.backgroundColor = .sub500

        // present the toast with the new style
        self.view.makeToast("This is a piece of toast", duration: 3.0, position: .top, style: style)
//        view.mak
        
//        view.makeToast("This is a piece of toast", duration: 2.0, point: CGPoint(x: 110.0, y: 110.0))
        print("click2")
    }
    
    @objc func pressedTitleButton(sender: UIButton) {
        print("click3")
        let apperance = TTADataPickerView.appearance()
        apperance.setConfirmButtonAttributes(att: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        apperance.setCancelButtonAttributes(att: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        apperance.setToolBarTintColor(color: .lightGray)
        apperance.setToolBarBarTintColor(color: UIColor(white: 0.9, alpha: 0.5))
        apperance.setTitleFont(font: UIFont.systemFont(ofSize: 14))
        apperance.setTitleColor(color: UIColor(red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0))
        
        let pickerView = TTADataPickerView(title: nil, type: .text, delegate: self)
        pickerView.textItemsForComponent = [["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"], ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"], ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"]]
        
        pickerView.show()
//        let pickerView = TTADataPickerView(title: "TTADataPickerView", type: .text)
//        pickerView.textItemsForComponent = [["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth"]]
        
    }

    @objc func pressedCommentButtton(sender: UIButton) {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.bottomHeightConstraint.constant = 48.0
            self?.isComment = true
            
        }
    }
    
    @objc func pressedReviewButton(sender: UIButton) {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.bottomHeightConstraint.constant = 80.0
            self?.isComment = false
        }
    }
}

extension DetailViewController: TTADataPickerViewDelegate {
    
}
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 3:
            return 1
        case 1:
            return 2
        case 2:
            return 2
        case 4:
            if isComment {
                return 2
            } else {
                return 1
            }
        default:
            return 0
        }
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
                cell.titleLabel.font = .boldSystemFont(ofSize: 16.0)
                cell.titleLabel.text = "다른 회차 둘러보기"
                cell.titleLabel.textColor = .gray0
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EpisodeTableViewCell.self), for: indexPath) as? EpisodeTableViewCell else {
                    return UITableViewCell()
                }
                cell.collectionView.register(UINib(nibName: String(describing: DramaListCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: DramaListCell.self))
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
                cell.titleLabel.font = .boldSystemFont(ofSize: 16.0)
                cell.titleLabel.text = "연관 드라마"
                cell.titleLabel.textColor = .gray0
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EpisodeTableViewCell.self), for: indexPath) as? EpisodeTableViewCell else {
                    return UITableViewCell()
                }
                cell.collectionView.register(UINib(nibName: String(describing: DramaListCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: DramaListCell.self))
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
            cell.commentButtton.setTitle("Comments", for: .normal)
            cell.commentButtton.setTitle("Comments", for: .selected)
            cell.commentButtton.isSelected = isComment
            cell.commentButtton.addTarget(target, action: #selector(pressedCommentButtton), for: .touchUpInside)
            
            cell.reviewButton.setTitle("Review", for: .normal)
            cell.reviewButton.setTitle("Review", for: .selected)
            cell.reviewButton.isSelected = !isComment
            cell.reviewButton.addTarget(target, action: #selector(pressedReviewButton), for: .touchUpInside)
            return cell
         case 4:
            if isComment {
                if indexPath.row == 0 {
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommentCell.self), for: indexPath) as? CommentCell else {
                        return UITableViewCell()
                    }
                    cell.configurationData(imageString: "https://druwa-repository-test.s3.ap-northeast-2.amazonaws.com/1234-1579626544607-446289.jpg", nick: "person", time: 57, comment: "서강준 갑자기 노래부르고 쓰러질때 뿜었다진짜", up: "1.67K", down: "321")
                    return cell
                 } else if indexPath.row == 1 {
                     guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SubCommentCell.self), for: indexPath) as? SubCommentCell else {
                         return UITableViewCell()
                     }
                    cell.configurationData(imageString: "https://druwa-repository-test.s3.ap-northeast-2.amazonaws.com/1234-1579626544607-446289.jpg", nick: "person", personNick: "person", time: 40, comment: "서강준 참 잘생겼죠. 내남자 너무 이뻐하지 말아주기...", up: "1.67K", down: "321")
                     return cell
                 }
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ReviewCell.self), for: indexPath) as? ReviewCell else {
                    return UITableViewCell()
                }
                cell.configurationData(imageString: "https://druwa-repository-test.s3.ap-northeast-2.amazonaws.com/1234-1579626544607-446289.jpg", title: "서강준 미친 외모에 한번 놀라고, 스토리에 한번 놀라고", content: "서강준 하드캐리 원맨쇼를 원한다면 강추!", nick: "person", time: 47, rating: 4.0)
            
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = (indexPath.section, indexPath.row)
        switch index {
        case (0,_):
            return 244
        case (1,0):
            return 52
        case (1,1):
            return 134
        case (2,0):
            return 52
        case (2,1):
            return 134
        case (3, _):
            return 48
        case (4, _):
            if isComment {
                return UITableView.automaticDimension
            } else {
               return 127
            }
        default:
            return 0
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
        return CGSize(width: 154.0, height: 136.0)
    }
}
