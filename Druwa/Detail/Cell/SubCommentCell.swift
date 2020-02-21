//
//  SubCommentCell.swift
//  Druwa
//
//  Created by leeyang on 24/01/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit

class SubCommentCell: UITableViewCell {
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var personNickName: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileView.layer.cornerRadius = 20.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configurationData(imageString: String, nick: String, personNick: String, time: Int, comment: String, up: String, down: String) {
        profileView.kf.setImage(with: URL(string: imageString)!)
        nickName.text = nick
        dateLabel.text = "\(time)"
        commentLabel.text = comment
        personNickName.text = personNick
        upButton.setTitle(up, for: .normal)
        upButton.setTitle(up, for: .selected)
        downButton.setTitle(down, for: .normal)
        downButton.setTitle(down, for: .selected)
    }
}
