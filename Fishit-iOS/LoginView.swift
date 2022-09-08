//
//  LoginView.swift
//  Fishit-iOS
//
//  Created by Minwoong Kim on 2022/08/27.
//
	
import SwiftUI

struct LoginView: View {
	@State private var action: Int? = 0
    var body: some View {
    	NavigationView{
        	VStack{
            Image("FishItLogo")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 250, height: 250 )
        	Spacer()
            Divider()
            LoginButtonView(imageName: "KaKaoButton")
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                          
            LoginButtonView(imageName: "GoogleButton")
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                          
            HStack(spacing: 80){
            	NavigationLink("로그인", destination: SignUpView()).tint(.gray)
                
                NavigationLink("회원가입", destination: SignUpView()).tint(.gray)
            }
            Spacer()
            }
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
        }
    }
}
