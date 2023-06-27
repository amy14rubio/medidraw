//
//  ContentView.swift
//  medidraw
//
//  Created by Amyruth Rubio on 6/26/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGreen)
                    .ignoresSafeArea() //Change color later
      
                VStack (spacing: 20.0){
                    Text("Medidraw") // Change font
                        .font(.title)
                        .fontWeight(.bold)
                    
                    NavigationLink(destination: DrawingPage()) {
                        Text("Draw")
                    }
                    NavigationLink(destination: InfoPage()) {
                        Text("Info")
                    }
                    NavigationLink(destination: AboutPage()) {
                        Text("About")
                    }

                    
                    
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
