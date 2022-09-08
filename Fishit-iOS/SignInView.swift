//
//  SignInView.swift
//  Fishit-iOS
//
//  Created by Somi Kim on 2022/09/08.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(spacing: 22.0){
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
                sendPostRequest("http://3.39.75.19:8080/api/v1/auth/new", parameters:
                    ["email": self.email,
                     "password": self.password
                     ]){
                    responseObject, error in guard let _ = responseObject, error == nil else {
                        print(error ?? "Unknown error")
                        return
                    }
                }
            }){
                Text("로그인").tint(.white)
            }.frame(width: 345, height: 47, alignment: .center)
            .background(Color("MainColor2"))
            .cornerRadius(8)
            .shadow(color: .gray, radius: 5, x: 3, y: 3)
        }.padding(EdgeInsets(top: 100, leading: 10, bottom: 100, trailing: 6)).padding(.vertical)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
