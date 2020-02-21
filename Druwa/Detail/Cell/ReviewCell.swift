//
//  ReviewCell.swift
//  Druwa
//
//  Created by leeyang on 24/01/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var ratingBackgroundView: UIView!
    
    lazy var starview: StarRateView = {
        let starView: StarRateView = StarRateView(frame: ratingBackgroundView.frame, totalStarCount: 5, currentStarCount: 0.0, starSpace: 0)
        ratingBackgroundView.addSubview(starView)
        return starView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        starview.removeFromSuperview()
    }
    
    func configurationData(imageString: String, title: String, content: String, nick: String, time: Int, rating: CGFloat) {
        titleLabel.text = title
        presentStarView(rating)
        profileView.layer.cornerRadius = profileView.frame.width / 2.0
        profileView.kf.setImage(with: URL(string: imageString)!)
        nickName.text = nick
        dateLabel.text = "\(time)"
        contentLabel.text = content
    }
    
    private func presentStarView(_ rating: CGFloat) {
        starview = StarRateView(frame: ratingBackgroundView.frame, totalStarCount: 5, currentStarCount: rating, starSpace: 0)
        starview.isPanEnable = false
        ratingBackgroundView.addSubview(starview)
        starview.snp.makeConstraints {
            $0.leading.top.bottom.trailing.equalToSuperview()
        }
    }
}
