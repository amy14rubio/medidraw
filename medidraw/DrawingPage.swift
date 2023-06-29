//
//  DrawingPage.swift
//  medidraw
//
//  Created by Moyo on 6/27/23.
//

import SwiftUI

//helped with making drawing pad strokes
//struct Line {
//    var points: [CGPoint]
//    var color: Color
//    var lineWidth: CGFloat
//}

struct DrawingPage: View {
    
    @State private var showDrawingPad = false
    @State var drawingPadItems: [DrawingPadItem] = []
    @State var grow = 100.0
    
    let layout = [
        GridItem(.adaptive(minimum: 100)),
    ]
    
    var body: some View {
        ZStack{
            //green background color
            Color(red: 118/255, green: 148/255, blue: 117/255)
                .ignoresSafeArea()
            
            VStack{
                Text("Drawing Prompt feature")
                
                Spacer()
                
                HStack {
                    Button(action: {
                        self.showDrawingPad = true
                    }) {
                        Text("+")
                    }
                    
                    Text("Drawing Pads Feature ")
                }
                
                LazyVGrid(columns: layout, content: {
                    ForEach (drawingPadItems) { drawingPadItem in
                        Canvas { context, size in
                            
                        }
                        .background(Color(red: 0.943, green: 0.953, blue: 0.844))
                        .cornerRadius(30)
                        .frame(width: 100, height:100)
                    }
                })
                
                Spacer()
                
                if showDrawingPad {
                    DrawingPadView(drawing: [], drawingPadItems: $drawingPadItems, showDrawingPad: $showDrawingPad)
                }
            }
            
            
            
        }
    }
}


struct DrawingPage_Previews: PreviewProvider {
    static var previews: some View {
        DrawingPage()
    }
}
