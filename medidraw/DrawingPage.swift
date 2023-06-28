//
//  DrawingPage.swift
//  medidraw
//
//  Created by Moyo on 6/27/23.
//

import SwiftUI

//helped with making drawing pad strokes
struct Line {
    var points = [CGPoint]()
    var color: Color = .black
    var lineWidth: Double = 1.0
}

struct DrawingPage: View {
    
    //drawing stroke vars
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    @State private var thickness: Double = 1.0
    
    //vars that helped animate the drawing pad
    @State private var grow = 100.0
    @State private var draw = false
    
    var body: some View {
        ZStack{
            //green background color
            Color(red: 118/255, green: 148/255, blue: 117/255)
                .ignoresSafeArea()
            
            VStack{
                Text("Drawing Prompt feature")
                
                Text("+ Drawing Pads feature")
                
                //note: we might have to make the "+ Drawing Pads feature" a button so that everytime the user clicks on it a new drawing pad can be appended to some sort of an array (i tried to loop the drawing pad and tried to just copy and paste the code to have empty slots of drawing pads but it didn't work so appending a new drawing pad to some sort of array might work, maybe?) - Amy
                
                //drawing pad
                VStack{
                    //drawing area
                    Canvas { context, size in
                        //creates stroke lines
                        for line in lines {
                            var path = Path()
                            path.addLines(line.points)
                            context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                        }
                    }
                    .padding(1)
                    .background(Color(red: 0.943, green: 0.953, blue: 0.844))
                    .frame(width: grow, height: grow)
                    .cornerRadius(30)
                    //animates the drawing pad when tapped
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)){
                            if draw == false{
                                draw = true
                                grow = 350.0
                            } else if draw == true{
                                draw = false
                                grow = 100.0
                            }
                        }
                    }
                    //creates stroke lines
                    .gesture(draw ? DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onChanged({value in
                            let newPoint = value.location
                            currentLine.points.append(newPoint)
                            self.lines.append(currentLine)
                        })
                        .onEnded({value in
                                self.lines.append(currentLine)
                                self.currentLine = Line(points: [], color: currentLine.color, lineWidth: thickness)
                        })
                        : nil
                    )
                    
                    
                    
                    //drawing toolbar
                    HStack{
                        if draw == true{
                            //thickness slider
                            Slider (value: $thickness, in: 1...50){
                            }
                            .onChange(of: thickness) { newThickness in
                                currentLine.lineWidth = newThickness
                            }
                            
                            //thickness slider text
                            Text("\(thickness, specifier: "%.f")")
                                .padding(10)
                                .font(.custom("Hiragino Kaku Gothic ProN", size: 15))
                            
                            //color picker
                            ColorPicker("", selection: $currentLine.color)
                                .multilineTextAlignment(.trailing)
                                .frame(width: 10)
                                .padding(40)
                        }
                    }
                    .padding(.horizontal, 30.0)
                    .background(Color(red: 0.943, green: 0.953, blue: 0.844))
                    .frame(width: grow, height: draw ? 70 : 0)
                    .cornerRadius(20)
                    .animation(.easeInOut(duration: 1), value: grow)
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
