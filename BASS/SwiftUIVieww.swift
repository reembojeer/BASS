//
//  SwiftUIVieww.swift
//  BASS
//
//  Created by RIM ABDULLAH BUJEIR on 27/03/1445 AH.
//

import SwiftUI

struct SwiftUIVieww: View {
    @State private var drawing = Path()
       @State private var currentPoint: CGPoint?
       @State private var pencilColor = Color.blue // Change the color here
    
    var body: some View {
        GeometryReader { geometry in
             ZStack {
                
                 Path { path in
                     path.addPath(drawing)
                 }
                 .stroke(pencilColor, lineWidth: 3)
                 .background(Color("minco"))
                 .gesture(
                     DragGesture(minimumDistance: 0.1)
                         .onChanged { value in
                             let location = value.location
                             if currentPoint != nil {
                                 drawing.addLine(to: location)
                             } else {
                                 drawing.move(to: location)
                             }
                             currentPoint = location
                         }
                         .onEnded { _ in
                             currentPoint = nil
                         }
                 )
             }
         }
     }
 }



#Preview {
    SwiftUIVieww()
}
