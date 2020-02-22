//
//  DramaModel.swift
//  Druwa
//
//  Created by leeyang on 22/02/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import Foundation
import ObjectMapper

class CurationResponseModel: Mappable {
    var dramas: [CurationModel]?
    var total: Int?

    required init?(map: Map) {

    }
 
    // Mappable
    func mapping(map: Map) {
        dramas    <- map["dramas"]
        total     <- map["Int"]
    }
}

class CurationModel: Mappable {
    var dramaId: Int?
    var title: String?
    var summary: String?
    var productionCompany: String?
    var images: [DramaImageModel]?
    var like: Int?
    var liked: Bool?
    var dislike: Int?
    var disliked: Bool?
    var createdAt: Date?
    var updatedAt: Date?
    var tag: [String]?

    required init?(map: Map) {

    }
 
    // Mappable
    func mapping(map: Map) {
        dramaId    <- map["dramaId"]
        title     <- map["title"]
        summary    <- map["summary"]
        productionCompany     <- map["productionCompany"]
        images    <- map["images"]
        like     <- map["like"]
        liked    <- map["liked"]
        dislike     <- map["dislike"]
        disliked    <- map["disliked"]
        createdAt    <- (map["createdAt"], DateTransform())
        updatedAt    <- (map["updatedAt"], DateTransform())
        tag    <- (map["tag"])
    }
}


class DramaImageModel: Mappable {
    var imageName: String?
    var imageUrl: String?
    var widthPixel: String?
    var heightPixel: String?
    var imageType: String?
    var createdAt: Date?
    var updatedAt: Date?

    required init?(map: Map) {

    }
 
    // Mappable
    func mapping(map: Map) {
        imageName    <- map["imageName"]
        imageUrl     <- map["imageUrl"]
        widthPixel   <- map["widthPixel"]
        heightPixel  <- map["heightPixel"]
        imageType    <- map["imageType"]
        createdAt    <- (map["createdAt"], DateTransform())
        updatedAt    <- (map["updatedAt"], DateTransform())
    }
}

class DramaModel: Mappable {
    var dramaId: Int?
    var title: String?
    var summary: String?
    var productionCompany: String?
    var images: [String]?
    var like: Int?
    var liked: Bool?
    var dislike: Int?
    var disliked: Bool?
    var createdAt: Date?
    var updatedAt: Date?

    required init?(map: Map) {

    }
 
    // Mappable
    func mapping(map: Map) {
        dramaId    <- map["dramaId"]
        title     <- map["title"]
        summary   <- map["summary"]
        productionCompany  <- map["productionCompany"]
        like    <- map["like"]
        liked    <- map["liked"]
        dislike    <- map["dislike"]
        disliked    <- map["disliked"]
        createdAt    <- (map["createdAt"], DateTransform())
        updatedAt    <- (map["updatedAt"], DateTransform())
    }
}
