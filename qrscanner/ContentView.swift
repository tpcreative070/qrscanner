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
        TabView {
            ScanView()
                .tabItem {
                    Label("Scan", systemImage: "list.dash")
                }
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "square.and.pencil")
                }
            
            MyCodesView()
                .tabItem {
                    Label("My codes", systemImage: "square.and.pencil")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "square.and.pencil")
                }
        }
        //        VStack {
        //            if let cgImage = image {
        //                Image(uiImage: UIImage(cgImage: cgImage))
        //                    .imageScale(.large)
        //                    .foregroundStyle(.tint)
        //            }
        //
        //            Text("Hello, world!")
        //        }
        //        .padding()
        //        .onAppear(){
        //            image = QRWriter().writeQRCode()
        //        }
    }
}

#Preview {
    ContentView()
}
