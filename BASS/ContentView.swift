//
//  ContentView.swift
//  BASS
//
//  Created by RIM ABDULLAH BUJEIR on 27/03/1445 AH.
//

import SwiftUI
import PhotosUI


struct ContentView: View {
    
    
    var body: some View {
        ZStack{
            Color("minco")
                .ignoresSafeArea()
              SwiftUIVieww()
                moodboard2()
          
            
            
        }
        VStack {
               
            
                   CustomBottomBar()
               
               }
              
              
           }
       }

struct CustomBottomBar: View {
    @State private var selectedItem: PhotosPickerItem?
//    @State private var selectedPhotoData: Data?
    var body: some View {
        

        
            VStack {
                HStack (spacing: 50) {
                    
                
                    Button(action: {
                    }) {
                        VStack{
                            PhotosPicker(selection: $selectedItem, matching: .any(of: [.images, .not(.livePhotos)])) {
                                VStack{
                                    
                                    Image(systemName: "photo.on.rectangle.angled")
                                        .font(.system(size: 30))
                                    Text("صوره")
                                        
                                    
                                }
                            }
                        }
                    }
                    Button(action: {
                        // Add action for the third image here
                    }) {
                        VStack{
                            Image(systemName: "pencil.tip")
                                .font(.system(size: 30))
                            Text("شخبط")//
                        }
                    }
                }
                
            }
        
        
        }
        
    }

#Preview {
    ContentView()
}
