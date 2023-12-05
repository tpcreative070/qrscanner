//
//  SettingsView.swift
//  qrscanner
//
//  Created by phong on 21/11/2023.
//

import Foundation
import SwiftUI

struct SettingsView : View {
    @State private var showSound  = false
    @State private var showVibrate = false
 
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment : .leading) {
                    HStack {
                        Image(systemName: "speaker.wave.1").frame(width: 30,height: 30)
                        Text("Sound")
                        Toggle(isOn: $showSound, label: {
                            Text("")
                        })
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    .hoverEffect(.highlight)
                    .onTapGesture {
                        
                    }
                  
                    
                    HStack {
                        Image(systemName: "iphone.gen1.radiowaves.left.and.right").frame(width: 30,height: 30)
                        Text("Vibrate")
                        Toggle(isOn: $showVibrate, label: {
                            Text("")
                        })
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                   
                    
                    HStack {
                        Image(systemName: "link").frame(width: 30,height: 30)
                        Text("Open websites automatically")
                        Spacer()
                        Image(systemName: "chevron.forward")
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                  
                    
                    HStack {
                        Image(systemName: "paintbrush").frame(width: 30,height: 30)
                        Text("Change app theme")
                        Spacer()
                        Image(systemName: "chevron.forward")
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                  
                    
                    HStack {
                        Image(systemName: "clock").frame(width: 30,height: 30)
                        Text("History \u{2022} iCloud")
                        Spacer()
                        Image(systemName: "chevron.forward")
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                 
                    
                    HStack {
                        Image(systemName: "line.3.horizontal.decrease").frame(width: 30,height: 30)
                        Text("Duplicate barcodes")
                        Spacer()
                        Image(systemName: "chevron.forward")
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                }.background(.white)
                
                Spacer(minLength: 30)
                
                //Privacy and policy
                VStack(alignment : .leading) {
                    HStack {
                        Image(systemName: "info.circle").frame(width: 30,height: 30)
                        Text("Introduction")
                        Spacer()
                        Image(systemName: "chevron.forward")
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                    HStack {
                        Image(systemName: "questionmark.circle").frame(width: 30,height: 30)
                        Text("Help & Feedback")
                        Spacer()
                        Image(systemName: "chevron.forward")
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                    HStack {
                        Image(systemName: "star").frame(width: 30,height: 30)
                        Text("Rate in App Store")
                        Spacer()
                        Image(systemName: "chevron.forward")
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                    HStack {
                        Image(systemName: "lock.shield").frame(width: 30,height: 30)
                        Text("Privacy policy")
                        Spacer()
                        Image(systemName: "chevron.forward")
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    
                }.background(.white)
                
                Spacer(minLength: 30)
                
                //Version label
                VStack(alignment : .leading){
                    Text("Version 2.0.0")
                }
                .frame(maxWidth: .infinity)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(.white)
            }
            .background(Color(hex : Constant.light_gray))
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SettingsView()
}
