//
//  HistoryView.swift
//  qrscanner
//
//  Created by phong on 21/11/2023.
//

import Foundation
import SwiftUI

struct HistoryView : View {
    @State var image : CGImage?
    
    var body : some View {
        VStack {
            if let cgImage = image {
                Image(uiImage: UIImage(cgImage: cgImage))
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
            
            Text("Hello, world!")
        }
        .padding()
        .onAppear(){
            image = QRWriter().writeQRCode()
        }
    }
}

#Preview {
    HistoryView()
}
