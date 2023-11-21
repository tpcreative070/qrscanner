//
//  ContentView.swift
//  qrscanner
//
//  Created by phong on 16/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State var image : CGImage?
    var body: some View {
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
    ContentView()
}
