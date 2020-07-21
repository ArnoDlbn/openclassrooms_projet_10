//
//  RecipleaseService.swift
//  Reciplease
//
//  Created by Arnaud Dalbin on 22/04/2020.
//  Copyright © 2020 Arnaud Dalbin. All rights reserved.
//

import Foundation
import Alamofire

class RecipleaseService {
    
    // MARK: - Properties
    
    private let session: AlamoSession
    
    // MARK: - Initialization
    
    init(session: AlamoSession = RecipleaseSession()) {
        self.session = session
    }
    
    // MARK: - Methods
    
    func request(from: Int, to: Int, ingredients: [String], completionHandler: @escaping (RecipleaseData?, Error?) -> Void) {
        
        guard let apiNumber = ApiConfiguration().apiNumber else { return }
        guard let url = URL(string: "https://api.edamam.com/search?&from=\(from)&to=\(to)&q=\(ingredients.joined(separator: ","))&app_id=\(apiNumber.apiId)&app_key=\(apiNumber.apiKey)") else { return }
        
        Alamofire.request(url).responseJSON { response in
            if response.data != nil {
                do {
                    let responseJSON = try JSONDecoder().decode(RecipleaseData.self, from: response.data!)
                    completionHandler(responseJSON, nil)
                } catch {
                    completionHandler(nil, (Error.self as! Error))
                }
            }
        }
    }
 
    
}
