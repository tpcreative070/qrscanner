//
//  ContentView.swift
//  qrscanner
//
//  Created by phong on 16/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ScanView()
                .tabItem {
                    Label("Scan", systemImage: "barcode.viewfinder")
                }
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock.fill")
                }
            
            MyCodesView()
                .tabItem {
                    Label("My codes", systemImage: "qrcode")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
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
