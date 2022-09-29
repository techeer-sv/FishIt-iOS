//
//  SignUpView.swift
//  Fishit-iOS
//
//  Created by Minwoong Kim on 2022/08/31.
//

import SwiftUI
import Alamofire

struct SignUpView: View {
	@State var email: String = ""
	@State var username: String = ""
	@State var password: String = ""
	@State var passwordCheck: String = ""
	
    var body: some View {
    	VStack(spacing: 10){
            TextField("이메일", text:$email)
            	.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
            	.frame(width: 345, height: 50, alignment: .center)
            	.overlay(RoundedRectangle(cornerRadius: 8)
             		.stroke(.gray, lineWidth: 0.8))
            
            TextField("닉네임", text: $username)
            	.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
            	.frame(width: 345, height: 50, alignment: .center)
            	.overlay(RoundedRectangle(cornerRadius: 8)
             		.stroke(.gray, lineWidth: 0.8))
            
            TextField("비밀번호", text: $password)
            	.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
            	.frame(width: 345, height: 50, alignment: .center)
            	.overlay(RoundedRectangle(cornerRadius: 8)
             		.stroke(.gray, lineWidth: 0.8))
            TextField("비밀번호 확인", text: $passwordCheck)
            	.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
            	.frame(width: 345, height: 50, alignment: .center)
            	.overlay(RoundedRectangle(cornerRadius: 8)
             		.stroke(.gray, lineWidth: 0.8))
            if password != passwordCheck && password != "" && passwordCheck != ""{
            	Text("비밀번호가 일치하지 않습니다.").foregroundColor(.red).font(.system(size: 10))
            }
            Spacer()
            Button(action: {
                print("ButtonPressed")
                signUp(email:self.email, username:self.username, password: self.password)
            }){
            	Text("회원가입").tint(.white)
            }.frame(width: 345, height: 47, alignment: .center)
            .background(Color("MainColor2"))
            .cornerRadius(8)
            .shadow(color: .gray, radius: 5, x: 3, y: 3)
        }
    }
}

func signUp(email:String, username: String, password:String) {
      let url = "http://3.39.75.19:8080/api/v1/users/new"
      let param = ["email": email,
                   "memberName": username,
                   "password": password
      ]

    AF.request(url,
       method: .post,
       parameters:param,
               encoder: JSONParameterEncoder.default).validate(statusCode:200..<300)
        .responseJSON{ response in
                switch response.result {
                    case .success:
                        print("success!")
                    if let jsonObject = try! response.result.get() as? [String: Any]{}
                    case .failure(let error):
                        print(error)
                        return
              }
            }
   }

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}


