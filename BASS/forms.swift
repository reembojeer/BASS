//
//  forms.swift
//  BASS
//
//  Created by RIM ABDULLAH BUJEIR on 29/03/1445 AH.
//

import SwiftUI

struct forms: View {
    
    @State private var selectedButtons: Set<Int> = []
      @State private var textInput = ""
      @State private var selectedDate = Date()
    
      @State private var isPressed = false
      
      // Define an array of texts for the buttons
      let buttonTitles: [String] = [
          "موالح", "عشاء", "قاعه", "حلويات", "ديكور",
          "كراسي", "طاولات", "مشروبات", "توزيعات", "عربات أكل",
          "قهوجيات", " صبابات "
      ]
      
      let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    var body: some View {
        NavigationStack{
            ZStack{
                // .navigationTitle("آضف لقائمتك")
                Color("minco")
                    .ignoresSafeArea()
                VStack{
                    VStack(alignment: .trailing){
                        Text("اضف لقائمتك")
                            .font(.title)
                            .bold()
                            .padding(.bottom, 25)
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(0..<buttonTitles.count) { index in
                                Button(action: {
                                    if selectedButtons.contains(index) {
                                        selectedButtons.remove(index)
                                    } else {
                                        selectedButtons.insert(index)
                                    }
                                }) {
                                    Text(buttonTitles[index])
                                        .padding(.vertical, 7.0)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(selectedButtons.contains(index) ? Color.c : Color.gray)
                                        .foregroundColor(.white)
                                        .font(.title3)
                                        .cornerRadius(6)
                                        
                                        
                                    
                                }
                            }
                        }
                        .padding(.bottom, 25)
        
                        Text("اسم المناسبة")
                            .bold()
                            .font(.headline)
                            TextField("", text: $textInput)
                            .frame(height: 20) // Set the desired height here
                            .padding() // Add padding if needed
                            .background(Color.white) // Set background color
                            .cornerRadius(10) // Apply corner radius for rounded corners
                            
                            
                   
                        
                            .padding(.bottom, 25)
                        
                        Text("تاريخ مناسبتك")
                            .bold()
                            .font(.headline)
                        DatePicker("", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                            .datePickerStyle(.wheel)
                            .bold()
                          
                            
                        
                        
            
                        
                        
                    }  .padding(.bottom, 25)
                   
                    NavigationLink(destination: texxxt()) {
                        Text("التالي")
                            .frame(width: 200, height: 50)
                            .background(Color.c) // Set the background color to red
                            .foregroundColor(.white) // Set the text color to white
                            .cornerRadius(10) // Add some corner radius for a rounded look
                    }
                   
                    
                }.padding()
                
            }
           
            .navigationTitle("خطط لمناسبتك")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        }
    }

#Preview {
    NavigationStack{
        forms()}
}
