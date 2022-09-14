//
//  sendAuthPostRequest.swift
//  Fishit-iOS
//
//  Created by Minwoong Kim on 2022/09/11.
//

import Foundation

func sendAuthPostRequest(_ url: String, parameters: [String: String], accessToken: String, completion: @escaping ([String: Any]?, Error?) -> Void) {
    let targetUrl = URL(string: url)
    let paramData = try? JSONSerialization.data(withJSONObject: parameters)
    
    var request = URLRequest(url: targetUrl!)
    request.httpMethod = "PUT"
    request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = paramData
    
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard
            let data = data,                              // is there data
            let response = response as? HTTPURLResponse,  // is there HTTP response
            200 ..< 300 ~= response.statusCode,           // is statusCode 2XX
            error == nil                                  // was there no error
        else {
            completion(nil, error)
            return
        }
        
        let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
        completion(responseObject, nil)
    }
    task.resume()
}
