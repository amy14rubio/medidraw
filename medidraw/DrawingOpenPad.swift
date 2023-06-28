//
//  DrawingOpenPad.swift
//  medidraw
//
//  Created by Moyo on 6/28/23.
//

import SwiftUI

struct DrawingOpenPad: View {
    var body: some View {
        ZStack {
            Color(red: 118/255, green: 148/255, blue: 117/255)
                .ignoresSafeArea()

            VStack (spacing: 20.0){
                Text("Drawing Pad")
                
                Spacer()
                
                
                
            }
        }
    }
}

struct DrawingOpenPad_Previews: PreviewProvider {
    static var previews: some View {
        DrawingOpenPad()
    }
}
