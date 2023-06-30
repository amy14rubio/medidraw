//
//  AboutPage.swift
//  medidraw
//
//  Created by Moyo on 6/27/23.
//

import SwiftUI

struct AboutPage: View {
    var body: some View {
        ZStack{
            // Color of the background
            Color(red: 118/255, green: 148/255, blue: 117/255)
                .ignoresSafeArea()
            
            VStack (spacing: 7.0){
                // Title Page
                Text("Medidraw")
                    .font(.custom("Bauhaus93", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                
                // Note: Change the format of this later
                
                Spacer()
                
                // Information about background
                
                HStack {
                    Text("Medidraw was made by Olivia, Amy, Moyo and Hiba. Our mission was to help people meditatively through a form of meditation, drawing. ")
                        .font(.custom("Hiragino Kaku Gothic ProN", size: 29.0))
                        .fontWeight(.black)
                        .padding()
                        .multilineTextAlignment(.center)
                }
                Spacer()
                                
            }
        }
    }
}

struct AboutPage_Previews: PreviewProvider {
    static var previews: some View {
        AboutPage()
    }
}
