//
//  EpisodeModel.swift
//  Druwa
//
//  Created by leeyang on 22/02/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import Foundation
import ObjectMapper


class EpisodeModel: Mappable {
    var dramaEpisodeId: Int?
    var title: String?
    var summary: String?
    var dramaTitle: String?
    var playUrl: String?
    var like: Int?
    var durationInMillis: Int?
    var dislike: Int?
    var episodeNumber: Int?
    var totalComments: Int?

    required init?(map: Map) {

    }
 
    // Mappable
    func mapping(map: Map) {
        dramaEpisodeId    <- map["dramaEpisodeId"]
        title     <- map["title"]
        summary   <- map["summary"]
        dramaTitle  <- map["dramaTitle"]
        playUrl    <- map["playUrl"]
        durationInMillis    <- map["durationInMillis"]
        dislike    <- map["dislike"]
        like    <- map["disliked"]
        episodeNumber    <- (map["episodeNumber"])
        totalComments    <- (map["totalComments"])
    }
}
