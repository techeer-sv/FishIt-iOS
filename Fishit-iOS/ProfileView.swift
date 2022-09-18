//
//  ProfileView.swift
//  Fishit-iOS
//
//  Created by Minwoong Kim on 2022/09/07.
//

import SwiftUI

struct ProfileView: View {
	var email: String = "test@test.com"
	var password: String = "test"
	@State var accessToken = ""
	var responseData = ""
    var body: some View {
    	var loginSample = LoginSample()
    	NavigationView{
            VStack{
            Spacer()
            Text("Email: \(email)")
            Text("User Name: test")
            Button(action: {
                    print(self.email + self.password)
                    
                    sendPostRequest("http://3.39.75.19:8080/api/v1/auth/new", parameters:
                                    ["email": loginSample.email, "password": loginSample.password]
                                     ){
                        responseObject, error in guard let _ = responseObject, error == nil else {
                            print(error ?? "Unknown error")
                            return
                        }
                        if let res = responseObject {
                            loginSample.accessToken = res["accessToken"] as! String
                            print("\(res)")
                            print("login access Token: \(loginSample.accessToken)")
                            self.accessToken = res["accessToken"] as! String
                        }
                        //accessToken = responseObject["accessToken"]!
                    }
                }){
                    Text("로그인")
                        .frame(width: 80, height: 10)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                        
                }
                Spacer()
                NavigationLink("회원정보 수정", destination: ProfileEditView(loginSample: LoginSample(email: loginSample.email, password: loginSample.password, accessToken: accessToken))).tint(.gray)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
