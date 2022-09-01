//
//  LoginView.swift
//  Fishit-iOS
//
//  Created by Minwoong Kim on 2022/08/27.
//
	
import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack{
        	
        	VStack{
         	Spacer()
            Image("FishItLogo")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 250, height: 250 )
        	Spacer()
            Divider()
            Spacer()
            LoginButtonView(imageName: "KakaoButton")
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                          
            LoginButtonView(imageName: "GoogleButton")
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                          
            HStack(spacing: 80){
            	Button(action: { 
                	print("Pressed")
                }) {
                    Text("로그인")
                        .accentColor(.gray)
                }
                Button(action: {
                	print("Pressed")
                }) {
                    Text("회원가입")
                        .accentColor(.gray)
                }
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
