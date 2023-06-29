//
//  DrawingPadItem.swift
//  medidraw
//
//  Created by Amyruth Rubio on 6/29/23.
//

import Foundation

class DrawingPadItem: Identifiable {
    var id = UUID()
    
    
    
    
    var drawing: [String]
    
    init(drawing: [String]) {
            self.drawing = drawing
        }
}
