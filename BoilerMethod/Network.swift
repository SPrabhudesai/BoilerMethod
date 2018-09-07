//
//  Network.swift
//  BoilerMethod
//
//  Created by shailesh on 20/08/18.
//  Copyright © 2018 Shailesh. All rights reserved.
//

import Foundation
 
struct API {
    let url:URL
    let config = URLSessionConfiguration.default
    let session:URLSession
    let decoder = JSONDecoder()
    
    static let shared = API()
    
    init(){
        url = URL(string: "https://jsonplaceholder.typicode.com")!
        session = URLSession(configuration: config)
        decoder.dateDecodingStrategy = .iso8601
    }
}

protocol APIListable: Decodable {
    static var endpoint: String { get }
    static func list(completion:(([Self]?) -> Void)?)
}

extension APIListable {
    static func list(completion:(([Self]?) -> Void)?) {
        let request = URLRequest(url: API.shared.url.appendingPathComponent(endpoint))
        let task = API.shared.session.dataTask(with: request) { (data, res, error) in
            if let data = data {
                do {
                    let data = try API.shared.decoder.decode([Self].self, from: data)
                    completion?(data)
                } catch {
                    print(error.localizedDescription)
                    completion?(nil)
                }
            } else {
                if let error = error {
                    print("Error", error.localizedDescription)
                }
                completion?(nil)
            }
        }
        task.resume()
    }
}
