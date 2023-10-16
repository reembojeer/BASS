import SwiftUI
import PhotosUI

struct moodboard2: View {
    @State private var selectedItem: PhotosPickerItem?
  @State private var selectedPhotoData: Image?
    @State private var selected = 0

    //@binding var arrayImages: [Images]
    var body: some View {
        
        ZStack{
            SwiftUIVieww()

           
            
            if let selectedPhotoData {
                GeometryReader { proxy in
                    selectedPhotoData
                        .resizable()
                        .frame(width: 300, height: 300)
                        .scaledToFit()
                        .clipShape(Rectangle())
                        .modifier(ImageModifier(contentSize: CGSize(width: proxy.size.width, height: proxy.size.height)))
                }
                   
            }
        }
        
      
        VStack{
            
    
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
                      
                    }) {
                        VStack{
                            Image(systemName: "pencil.tip")
                                .font(.system(size: 30))
                            Text("شخبط")//
                        }
                    }
                    
                    
                }
                
            }
        
            .onChange(of: selectedItem) { _ in
                        Task {
                            if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                                if let uiImage = UIImage(data: data) {
                                    selectedPhotoData = Image(uiImage: uiImage)
                                    
                                    //array.append(selectedPhotoData)
                                    return
                                }
                            }

                            print("Failed")
                        }
                    }
        }
        
    }

#Preview {
    moodboard2()
}
