//
//  DrawingPadView.swift
//  medidraw
//
//  Created by Amyruth Rubio on 6/29/23.
//

import SwiftUI

//helped with making drawing pad strokes
struct Line {
    var points: [CGPoint]
    var color: Color
    var lineWidth: CGFloat
}



struct DrawingPadView: View {
    
    //drawing stroke vars
    @State private var lines = [Line]()
    @State private var deletedLines = [Line]()
    @State private var selectedColor: Color = .black
    @State private var thickness: CGFloat = 1
    
    @State var drawing: [String]
    @Binding var drawingPadItems: [DrawingPadItem]
    @Binding var isAddDrawingPressed: Bool
    
    var canvasPallete: some View {
        //drawing area
        return Canvas { context, size in
            //creates stroke lines
            for line in lines {
                var path = Path()
                path.addLines(line.points)
                context.stroke(path, with: .color(line.color), style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round, lineJoin: .round))
            }
        }
        .background(Color(red: 0.943, green: 0.953, blue: 0.844))
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
        
    }
    
    
    var body: some View {
        ZStack{
            //green background color
            Color(red: 118/255, green: 148/255, blue: 117/255)
                .ignoresSafeArea()
            
            //drawing pad
            VStack{
                
                canvasPallete
                    .frame(width: 350, height: 350)
                
                
                //drawing toolbar
                VStack{
                    
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
                            .padding(.horizontal, 40.0)
                        
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
                    
                    //done button
                    Button(action: {
                        self.addDrawing(drawing: self.drawing)
                        isAddDrawingPressed = false
                        
                    }) {
                        Text("Done")
                    }
                    
                }
                .padding(.horizontal, 30.0)
                .padding(.vertical, 20.0)
                .background(Color(red: 0.943, green: 0.953, blue: 0.844))
                .cornerRadius(20)
                .frame(width: 350, height:  170)
                .padding(0)
            }
            .accentColor(.gray)
        }
    }
    private func addDrawing(drawing: [String]) {
        let draw = DrawingPadItem(drawing: [])
        drawingPadItems.append(draw)
    }
}

struct DrawingPadView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingPadView(drawing: [], drawingPadItems: .constant([]), isAddDrawingPressed: .constant(true))
    }
}
