//
//  InfoPage.swift
//  medidraw
//
//  Created by Moyo on 6/27/23.
//

import SwiftUI

struct InfoPage: View {
    var body: some View {
        ZStack {
            Color(red: 118/255, green: 148/255, blue: 117/255)
                .ignoresSafeArea()
            VStack {
                Text("Info Page")
                    .font(.custom("Bauhaus93", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Spacer()
                
                Text("Lorem Ipsum....")
                    .font(.custom("Hiragino Kaku Gothic ProN", size: 14.0))
                    .fontWeight(.black)
                    .padding()
                    .multilineTextAlignment(.center)
                Spacer() 
            }
        }
    }
}

struct InfoPage_Previews: PreviewProvider {
    static var previews: some View {
        InfoPage()
    }
}
