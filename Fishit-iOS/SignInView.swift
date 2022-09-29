//
//  SignInView.swift
//  Fishit-iOS
//
//  Created by Somi Kim on 2022/09/15.
//

import SwiftUI
import Alamofire

struct SignInView: View {
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(spacing: 10){
            Spacer()
            TextField("이메일", text:$email)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
                .frame(width: 345, height: 50, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 8)
                     .stroke(.gray, lineWidth: 0.8))
            
            TextField("비밀번호", text: $password)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
                .frame(width: 345, height: 50, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 8)
                     .stroke(.gray, lineWidth: 0.8))
           
            Spacer()
            Button(action: {
                print("ButtonPressed")
                AF.request("http://3.39.75.19:8080/api/v1/auth/new",
                   method: .post,
                   parameters:
                    ["email": self.email,
                     "password": self.password
                    ], encoder: JSONParameterEncoder.default).validate(statusCode:200..<300)
                    .responseJSON{ response in
                            switch response.result {
                                case .success:
                                    print("success!")
                                    if let jsonObject = try! response.result.get() as? [String: Any] {
                                        let result = jsonObject["accessToken"] as? String
                                        let timestamp = jsonObject["accessTokenExpiresIn"] as? String
                                        let userId = jsonObject["grantType"] as? String
                                        let userPassword = jsonObject["refreshToken"] as? String
                                        print(result!)
                                    }
                                case .failure(let error):
                                    print(error)
                                    return
                          }
                        }
               
                    }){
                Text("로그인").tint(.white)
            }.frame(width: 345, height: 47, alignment: .center)
            .background(Color("MainColor2"))
            .cornerRadius(8)
            .shadow(color: .gray, radius: 5, x: 3, y: 3)
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
