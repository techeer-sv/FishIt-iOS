//
//  UserInfoEditView.swift
//  Fishit-iOS
//
//  Created by Minwoong Kim on 2022/09/06.
//

import SwiftUI

struct ProfileEditView: View {
	let loginSample: LoginSample
	@State var oldPassword = ""
	@State var newPassword = ""
	@State var reNewPassword = ""
	
    var body: some View {
    	VStack{
        	TextField("현재 비밀번호", text: $oldPassword)
            	.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
            	.frame(width: 345, height: 50, alignment: .center)
            	.overlay(RoundedRectangle(cornerRadius: 8)
             		.stroke(.gray, lineWidth: 0.8))
            
            TextField("변경 할 비밀번호", text: $newPassword)
            	.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
            	.frame(width: 345, height: 50, alignment: .center)
            	.overlay(RoundedRectangle(cornerRadius: 8)
             		.stroke(.gray, lineWidth: 0.8))
            TextField("비밀번호 확인", text: $reNewPassword)
            	.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
            	.frame(width: 345, height: 50, alignment: .center)
            	.overlay(RoundedRectangle(cornerRadius: 8)
             		.stroke(.gray, lineWidth: 0.8))
            Spacer()
            
            Button(action: {
                    sendAuthPostRequest("http://3.39.75.19:8080/api/v1/users/", parameters:
                                    ["newPassword": newPassword, "oldPassword": oldPassword, "reNewPassword": reNewPassword], accessToken: loginSample.accessToken
                                     ){
                        responseObject, error in guard let _ = responseObject, error == nil else {
                            print(error ?? "asdfasdf")
                            return
                        }
                        if let res = responseObject {
                            print(res)
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
        }
    }



struct UserInfoEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditView(loginSample: LoginSample(email: "test@test.com", password: "test", accessToken: "test"), oldPassword: "test", newPassword: "test", reNewPassword: "test")
    }
}

}
