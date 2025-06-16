//
//  CardView.swift
//  MatchingWithSwiftUI
//
//  Created by 木下喬仁 on 2025/06/11.
//

import SwiftUI

struct CardView: View {
    
    @State private var offset: CGSize = .zero
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background
            Color.black
            
            // image
            imageLayer
            
            // Gradient
            LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
            
            // Infomation
            informationLayer
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .offset(offset)
        .gesture(gesture)
    }
}

#Preview {
    ListView()
}

// MARK: -UI
extension CardView {
    
    private var imageLayer: some View {
        Image("user01")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100)
    }
    
    private var informationLayer: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text("ブルー")
                    .font(.largeTitle.bold())
                
                Text("99")
                    .font(.title)
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.white, .blue)
                    .font(.title2)
            }
            
            Text("よろしくお願いします")
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

// MARK: -Action
extension CardView {
    
    private var gesture: some Gesture {
        DragGesture()
            .onChanged{ value in
                let width = value.translation.width
                let height = value.translation.height
                
//                var limitedHeight: CGFloat = 0
//                
//                if (height > 0) {
//                    if (height > 100) {
//                        limitedHeight = 100
//                    } else {
//                        limitedHeight = height
//                    }
//                } else {
//                    if (height < -100) {
//                        limitedHeight = -100
//                    } else {
//                        limitedHeight = height
//                    }
//                }
                
                let limitedHeight = height > 0 ? min(height, 100) : max(height, -100)
                
                offset = CGSize(width: width, height: limitedHeight)
            }
            .onEnded { value in
                withAnimation(.smooth) {
                    let width = value.translation.width
                    let height = value.translation.height
                    
                    guard let window = UIApplication.shared.connectedScenes.first as?
                            UIWindowScene else { return }
                    let screenWidth = window.screen.bounds.width
                    
                    if (abs(width) > (screenWidth / 4)) {
                        offset = CGSize(width: width > 0 ? screenWidth  * 1.5: -screenWidth * 1.5, height: height)
                    } else {
                        offset = .zero
                    }
                }
            }
    }
}
