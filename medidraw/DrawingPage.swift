//
//  DrawingPage.swift
//  medidraw
//
//  Created by Moyo on 6/27/23.
//

import SwiftUI

//helped with making drawing pad strokes
struct Line {
    var points: [CGPoint]
    var color: Color
    var lineWidth: CGFloat
}

struct DrawingPage: View {
    
    //drawing stroke vars
    @State private var lines = [Line]()
    @State private var deletedLines = [Line]()
    @State private var selectedColor: Color = .black
    @State private var thickness: CGFloat = 1
    
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
                        // Code that will allow new pad to be made
                    }) {
                        Text("+") /* This is the button, we can make another file that will apply these changes. My thought process is that we can create a new file that once the button is clicked that file is a new pad is made and it is shown below. Then all the code that lets one go into the new pad is applied. It's just a rough thought for now.
                                   */
                    }
                    
                    Text("Drawing Pads Feature ")
                }
                
                // Considering what we've just learned today with the to do list we may be able to implement this - Moyo
                
                //  i deleted the drawing pad animation as it doesn't work with the new code that lets the undo and redo buttons work, also if we're adding the to do list stuff we could also somehow add the core data thing in order to save the data for the drawings, i think we're going to learn how to add the core data in iteration 2 of the to do list project - Amy
                
                
                //Idea: Put the code in a class, so once the button is clicked it would print this whole thing?
                
                //yeah i agree! we could put the drawing pad code into a separate file kind of like the NewToDoView from the to do list project - Amy
                
                //drawing pad
                VStack{
                    //drawing area
                    Canvas { context, size in
                        //creates stroke lines
                        for line in lines {
                            var path = Path()
                            path.addLines(line.points)
                            context.stroke(path, with: .color(line.color), style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round, lineJoin: .round))
                        }
                    }
                    .padding(1)
                    .background(Color(red: 0.943, green: 0.953, blue: 0.844))
                    .frame(width: 350, height: 350)
                    .cornerRadius(30)
                    //creates stroke lines
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onChanged({value in
                            let newPoint = value.location
                            if value.translation.width + value.translation.height == 0 {
                                lines.append(Line(points:[newPoint], color: selectedColor, lineWidth: thickness))
                            } else {
                                let index = lines.count - 1
                                self.lines[index].points.append(newPoint)
                            }
                        })
                        .onEnded({value in
                            if let last = lines.last?.points, last.isEmpty {
                                lines.removeLast()
                            }
                        })
                    )
                    
                    
                    //drawing toolbar
                    HStack{
                        //thickness slider
                        Slider (value: $thickness, in: 1...50){
                        }
                        
                        //thickness slider text
                        Text("\(thickness, specifier: "%.f")")
                            .padding(10)
                            .font(.custom("Hiragino Kaku Gothic ProN", size: 15))
                            
                        //color picker
                        ColorPicker("", selection: $selectedColor)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 10)
                            .padding(40)
                          
                        //undo
                        Button {
                            let last = lines.removeLast()
                            deletedLines.append(last)
                            } label: {
                                Image(systemName: "arrow.uturn.backward.circle")
                            }
                        
                        //redo
                        Button {
                            let last = deletedLines.removeLast()
                            lines.append(last)
                            } label: {
                                Image(systemName: "arrow.uturn.forward.circle")
                            }
                    }
                    .padding(.horizontal, 30.0)
                    .background(Color(red: 0.943, green: 0.953, blue: 0.844))
                    .frame(width: 350, height:  70)
                    .cornerRadius(20)
                    
                }
                .accentColor(.gray)
                Spacer()
            }
            
            
            
        }
    }
}


struct DrawingPage_Previews: PreviewProvider {
    static var previews: some View {
        DrawingPage()
    }
}
