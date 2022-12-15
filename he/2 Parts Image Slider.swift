////
////  slider.swift
////  he
////
////  Created by Hesamoddin on 10/22/21.
////

import SwiftUI

@available(iOS 15.0, *)
struct slide: View {
@State var index = 0

    var images : URL
    
    
var body: some View {
    GeometryReader { geo in
    VStack(spacing: 20) {
        
        PagingView(index: $index.animation(), maxIndex: 1) {
            
                AsyncImage(url: images) {
                    phase in switch phase {
                        case .failure: Image(systemName: "photo") .font(.largeTitle)
                        case .success(let image): image .resizable()
                        default: ProgressView() }
                
            }
        }
//        .aspectRatio(3/4, contentMode: .fit)

     
    }
    }
}
}


struct PagingView<Content>: View where Content: View {

@Binding var index: Int
    
let maxIndex: Int
let content: () -> Content

@State private var offset = CGFloat.zero
@State private var dragging = false

init(index: Binding<Int>, maxIndex: Int, @ViewBuilder content: @escaping () -> Content) {
    
    self._index = index
    self.maxIndex = maxIndex
    self.content = content
}
    
    var body: some View {
    ZStack(alignment: .bottomTrailing) {
        GeometryReader { geometry in
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    self.content()
                    
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                        .clipped()
                    
                }
            }
            
            .content.offset(x: self.offset(in: geometry), y: 0)
            .frame(width: geometry.size.width, alignment: .leading)
            .gesture(
                
                DragGesture().onChanged { value in
                    self.dragging = true
                    self.offset = -CGFloat(self.index) * geometry.size.width + value.translation.width
                    
                }
                
                .onEnded { value in
                    let predictedEndOffset = -CGFloat(self.index) * geometry.size.width + value.predictedEndTranslation.width
                    let predictedIndex = Int(round(predictedEndOffset / -geometry.size.width ))
                    
                    

                    withAnimation(.easeOut) {
                        self.dragging = false
                    }
                }
            )
        }
        .clipped()

//        PageControl(index: $index, maxIndex: maxIndex)
    }
}

func offset(in geometry: GeometryProxy) -> CGFloat {
    if self.dragging {
        return max(min(self.offset, 0), -CGFloat(self.maxIndex) * geometry.size.width)
    } else {
        return -CGFloat(self.index) * geometry.size.width
    }
}

func clampedIndex(from predictedIndex: Int) -> Int {
    let newIndex = min(max(predictedIndex, self.index - 1), self.index + 1)
    guard newIndex >= 0 else { return 0 }
    guard newIndex <= maxIndex else { return maxIndex }
    return newIndex
}
}


//
//struct PageControl: View {
//@Binding var index: Int
//let maxIndex: Int
//
//var body: some View {
//    HStack(spacing: 8) {
//            Circle()
//                .fill(index == self.index ? Color.white : Color.gray)
//                .frame(width: 8, height: 8)
//
//    }
//    .padding(15)
//}
//}


//@available(iOS 15.0, *)
//struct slide_Previews: PreviewProvider {
//    static var previews: some View {
//        slide(, images: <#[URL]#>)
//            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
//    }
//}
//

//
//import SwiftUI
//
//struct slider: View {
//    @State var index = 0
//
//       var images = ["1", "2", "3", "1"]
//
//       var body: some View {
//           VStack(spacing: 20) {
//
//               PagingView(index: $index.animation(), maxIndex: images.count - 1) {
//                   ForEach(self.images, id: \.self) { imageName in
//                       Image(imageName)
//                           .resizable()
//                           .scaledToFill()
//                   }
//               }
//
//               .aspectRatio(3/3, contentMode: .fit)
//               .clipShape(RoundedRectangle(cornerRadius: 25))
//
//
//
//               PagingView(index: $index.animation(), maxIndex: images.count - 1) {
//                   ForEach(self.images, id: \.self) { imageName in
//                       Image(imageName)
//                           .resizable()
//                           .scaledToFill()
//                   }
//               }
//               .aspectRatio(3/4, contentMode: .fit)
//               .clipShape(RoundedRectangle(cornerRadius: 15))
//
//               Stepper("Index: \(index)", value: $index.animation(.easeInOut), in: 0...images.count-1)
//                   .font(Font.body.monospacedDigit())
//           }
//           .padding()
//       }
//    }
//
//
//
//    struct PagingView<Content>: View where Content: View {
//
//        @Binding var index: Int
//        let maxIndex: Int
//        let content: () -> Content
//
//        @State private var offset = CGFloat.zero
//        @State private var dragging = false
//
//        init(index: Binding<Int>, maxIndex: Int, @ViewBuilder content: @escaping () -> Content) {
//            self._index = index
//            self.maxIndex = maxIndex
//            self.content = content
//        }
//
//        var body: some View {
//            ZStack(alignment: .bottomTrailing) {
//                GeometryReader { geometry in
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 0) {
//                            self.content()
//                                .frame(width: geometry.size.width, height: geometry.size.height)
//                                .clipped()
//                        }
//                    }
//                    .content.offset(x: self.offset(in: geometry), y: 0)
//                    .frame(width: geometry.size.width, alignment: .leading)
//                    .gesture(
//                        DragGesture().onChanged { value in
//                            self.dragging = true
//                            self.offset = -CGFloat(self.index) * geometry.size.width + value.translation.width
//                        }
//                        .onEnded { value in
//                            let predictedEndOffset = -CGFloat(self.index) * geometry.size.width + value.predictedEndTranslation.width
//                            let predictedIndex = Int(round(predictedEndOffset / -geometry.size.width))
//                            self.index = self.clampedIndex(from: predictedIndex)
//                            withAnimation(.easeOut) {
//                                self.dragging = false
//                            }
//                        }
//                    )
//                }
//                .clipped()
//
////                PageControl(index: $index, maxIndex: maxIndex)
//            }
//        }
//
//        func offset(in geometry: GeometryProxy) -> CGFloat {
//            if self.dragging {
//                return max(min(self.offset, 0), -CGFloat(self.maxIndex) * geometry.size.width)
//            } else {
//                return -CGFloat(self.index) * geometry.size.width
//            }
//        }
//
//
//
//
//
//        func clampedIndex(from predictedIndex: Int) -> Int {
//            let newIndex = min(max(predictedIndex, self.index - 1), self.index + 1)
//            guard newIndex >= 0 else { return 0 }
//            guard newIndex <= maxIndex else { return maxIndex }
//            return newIndex
//        }
//    }
//
//
//
//
//
//    struct PageControl: View {
//        @Binding var index: Int
//        let maxIndex: Int
//        var body: some View {
//            GeometryReader { geo in
//            HStack(spacing: 8) {
//                ForEach(0...maxIndex, id: \.self) { index in
//                    Circle()
//                        .fill(index == self.index && index == maxIndex ? Color.red :
//                            index == self.index ? Color.white : Color.gray)
//
//
//                        .frame(width: 8, height: 8)
//                    }
//                }
//            }
//            .padding(15)
//        }
//    }
//
//
