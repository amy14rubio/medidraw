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
                
                Text("In AATA’s May 2020 coronavirus impact report, therapists pointed out that individuals are simply tired of talking about the pandemic and such feelings—and, because of all-day meetings on Zoom, talking in general. During art therapy, they don’t have to say a word if they don’t want to—but they can still work through their emotions.")
                    .font(.custom("Hiragino Kaku Gothic ProN", size: 20.0))
                    .fontWeight(.black)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Text("Art is a great way to destress and center your thoughts. Whether you choose to doodle while focusing on school work, or use art as a form of self expression, our app is there to guide you through that.")
                    .font(.custom("Hiragino Kaku Gothic ProN", size: 20.0))
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
