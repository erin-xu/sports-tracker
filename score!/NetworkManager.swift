//
//  NetworkManager.swift
//  score!
//
//  Created by Erin Xu on 12/2/21.
//

import Foundation
import Alamofire

class NetworkManager {
    static let host = "https://scoreproject.herokuapp.com"
    
    static func getAllEvents(completion: @escaping ([Event]) -> Void) {
        let endpt = "\(host)/api/events/"
        
        AF.request(endpt, method: .get).validate().responseData { response in
            switch response.result{
                
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(EventResponse.self, from: data) {
                    completion(userResponse.events)
                }
            }
        }
    }
    
    static func getSpecificEvent(id: Int, completion: @escaping (Event) -> Void) {
        let endpt = "\(host)/api/events/\(id)/"
        
        AF.request(endpt, method: .get).validate().responseData { response in
            switch response.result{
                
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode((Event).self, from: data) {
                    completion(userResponse)
                }
            }
        }
    }
    
    static func getAllTeams(completion: @escaping ([Team]) -> Void) {
        let endpt = "\(host)/api/teams/"
        
        AF.request(endpt, method: .get).validate().responseData { response in
            switch response.result{
                
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(TeamResponse.self, from: data) {
                    completion(userResponse.teams)
                }
            }
        }
    }
    
    static func getSpecificTeam(id: Int, completion: @escaping (Team) -> Void) {
        let endpt = "\(host)/api/teams/\(id)/"
        
        AF.request(endpt, method: .get).validate().responseData { response in
            switch response.result{
                
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode((Team).self, from: data) {
                    completion(userResponse)
                }
            }
        }
    }
}
