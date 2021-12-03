//
//  NetworkManager.swift
//  score!
//
//  Created by Erin Xu on 12/2/21.
//

import Foundation
import Alamofire

class NetworkManager {
    static let host = ""
    
    static func getAllEvents(completion: @escaping ([Event]) -> Void) {
        let endpt = "\(host)/api/events/"
        AF.request(endpt, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let postResponse = try? jsonDecoder.decode([Event].self, from: data) {
                    let posts = postResponse
                    completion(posts)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
