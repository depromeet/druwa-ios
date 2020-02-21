//
//  CommentCell.swift
//  Druwa
//
//  Created by leeyang on 24/01/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var reComment: UIButton!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 20.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        nickName.text = nil
        timeLabel.text = nil
        commentLabel.text = nil
        moreButton.setImage(UIImage(named: "iconMore"), for: .normal)
        moreButton.setImage(UIImage(named: "iconMore"), for: .selected)
        reComment.setImage(UIImage(named: "iconComment"), for: .normal)
        reComment.setImage(UIImage(named: "iconComment"), for: .selected)
        reComment.setTitle("댓글", for: .normal)
        reComment.setTitle("댓글", for: .selected)
        upButton.setImage(UIImage(named: "iconComment"), for: .normal)
        upButton.setImage(UIImage(named: "iconComment"), for: .selected)
        upButton.setTitle("1.67K", for: .normal)
        upButton.setTitle("1.67K", for: .selected)
        downButton.setImage(UIImage(named: "likeUncontourDefault"), for: .normal)
        downButton.setImage(UIImage(named: "likeUncontourDefault"), for: .selected)
        downButton.setTitle("321", for: .normal)
        downButton.setTitle("321", for: .selected)
    }
    
    func configurationData(imageString: String, nick: String, time: Int, comment: String, up: String, down: String) {
        profileImageView.kf.setImage(with: URL(string: imageString)!)
        nickName.text = nick
        timeLabel.text = "\(time)"
        commentLabel.text = comment
        upButton.setTitle(up, for: .normal)
        upButton.setTitle(up, for: .selected)
        downButton.setTitle(down, for: .normal)
        downButton.setTitle(down, for: .selected)
    }
}
