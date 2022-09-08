//
//  LoginButtonView.swift
//  Fishit-iOS
//
//  Created by Minwoong Kim on 2022/08/29.
//

import SwiftUI

struct LoginButtonView: View {
    let imageName: String
    
    
    var body: some View {
	Button(action: {
                print("Button pressed")
            }) {
                Image(imageName).resizable().frame(width: 300, height: 45)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            }
            
    }
	
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView(imageName: "GoogleButton")
        .previewLayout(.sizeThatFits)
    }
}
