//
//  requestSample.swift
//  Fishit-iOS
//
//  Created by Minwoong Kim on 2022/09/12.
//

import Foundation
import Alamofire

func requestSample(){
	AF.request("http://localhost:5000/test/post", method: .post, parameters: ["key": "hello!"], encoding: URLEncoding.httpBody).responseJSON() { response in
  switch response.result {
  case .success:
    if let data = try! response.result.get() as? [String: Any] {
      print(data)
    }
  case .failure(let error):
    print("Error: \(error)")
    return
  }
}
}
