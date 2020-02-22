//
//  DramaService.swift
//  Druwa
//
//  Created by leeyang on 22/02/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

//func
class DramaService {
    var host: String = {
        return "https://api.druwa.site/"
    }()
    
    func getCurationList(index: Int, completion: @escaping([CurationModel]?) -> Void) {
        let path = "curation/\(index)"
        let headers = ["Accept":"application/json"]
        Alamofire.request("\(host)\(path)", method: .get, parameters: nil, headers: headers).responseObject { (response: DataResponse<CurationResponseModel>) in
        
            let curations = response.result.value
            completion(curations?.dramas)
        }
        
    }
    func getDramaImageList(index: Int, completion: @escaping([DramaImageModel]?) -> Void) {
        let path = "dramas/\(index)/images"
        let headers = ["Accept":"application/json"]
        
        Alamofire.request("\(host)\(path)", method: .get, parameters: nil, headers: headers).responseArray { (response: DataResponse<[DramaImageModel]>) in
            let dramas = response.result.value
            completion(dramas)
        }
    }
    
    func getDramaList(index: Int, completion: @escaping([DramaModel]?) -> Void) {
        let path = "dramas/\(index)"
        let headers = ["Accept":"application/json"]
       
        Alamofire.request("\(host)\(path)", method: .get, parameters: nil, headers: headers).responseArray { (response: DataResponse<[DramaModel]>) in
            let dramas = response.result.value
            completion(dramas)
        }
    }
}
