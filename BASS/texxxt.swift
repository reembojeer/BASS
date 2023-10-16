//
//  texxxt.swift
//  BASS
//
//  Created by RIM ABDULLAH BUJEIR on 27/03/1445 AH.
//

import SwiftUI

struct texxxt: View {
    @State private var isTextFieldVisible = false
     @State private var commentText = ""
     @State private var likes = 0
     @State private var dislikes = 0

     var body: some View {
         ZStack {
             Image("logo")
                 .resizable()
                 .frame(width: 200, height: 200)
                 .onTapGesture {
                     isTextFieldVisible.toggle()
                 }

             if isTextFieldVisible {
                 Color.black.opacity(0.5)
                     .edgesIgnoringSafeArea(.all)
                     .onTapGesture {
                         isTextFieldVisible = false
                     }

                 VStack {
                     HStack {
                         Spacer()
                         Button(action: {
                             likes += 1
                         }) {
                             Image(systemName: "hand.thumbsup")
                         }
                         .padding()
                         Button(action: {
                             dislikes += 1
                         }) {
                             Image(systemName: "hand.thumbsdown")
                         }
                         .padding()
                     }

                     TextField("Add a comment", text: $commentText)
                         .textFieldStyle(RoundedBorderTextFieldStyle())
                         .padding()

                     Button("Submit") {
                         // Handle submission or any other actions here
                         isTextFieldVisible = false
                     }
                     .padding()
                 }
                 .background(Color.white)
                 .cornerRadius(10)
                 .padding()
             }
         }
     }
 }

#Preview {
    texxxt()
}
