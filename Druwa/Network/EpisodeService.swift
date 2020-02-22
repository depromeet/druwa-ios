//
//  EpisodeService.swift
//  Druwa
//
//  Created by leeyang on 22/02/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

//func
class EpisodeService {
    var host: String = {
        return "https://api.druwa.site/"
    }()
    
    func getEpisodeList(dramaId: Int, episodeId: Int, completion: @escaping([EpisodeModel]?) -> Void) {
        let path = "dramas/\(dramaId)/episodes/\(episodeId)"
        let headers = ["Accept":"application/json",
                        "Content-Type": "application/json; charset=UTF-8"]
        
        Alamofire.request("\(host)\(path)", method: .get, parameters: nil, headers: headers).responseArray { (response: DataResponse<[EpisodeModel]>) in
            let dramas = response.result.value
            completion(dramas)
        }
    }
//    
//    func getDramaList(index: Int, completion: @escaping([DramaModel]?) -> Void) {
//        let path = "dramas/\(index)"
//        let headers = ["Accept":"application/json"]
//       
//        Alamofire.request("\(host)\(path)", method: .get, parameters: nil, headers: headers).responseArray { (response: DataResponse<[DramaModel]>) in
//            let dramas = response.result.value
//            completion(dramas)
//        }
//    }
}
