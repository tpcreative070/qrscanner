//
//  DetailsView.swift
//  qrscanner
//
//  Created by phong on 25/11/2023.
//

import SwiftUI
import RealmSwift

struct DetailsView : View {
    
    @State private var hiddenIcon = true
    @ObservedResults(HistoryModel.self)
    var history
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                
                VStack {
                    HStack(spacing:0){
                        if hiddenIcon {
                            Image(systemName: "square.and.arrow.up.circle").frame(width: 20,height: 20)
                        }
                        Text("This is text")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading).padding(.leading , 20).padding(.trailing, 20).padding(.top,20)
                        .padding(.bottom,0)
                    VStack(alignment: .leading,spacing: 5) {
                        Text("Website").fontWeight(.bold)
                        Text("https:tpcreative.co")
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment : .leading)
                    .padding(.leading,20).padding(.top,5).padding(.trailing,20).padding(.bottom,20)
                   
                }.background(.white)
                
                Spacer(minLength: 20)
                
                VStack {
                    HStack(spacing:0){
                        if hiddenIcon {
                            Image(systemName: "square.and.arrow.up.circle").frame(width: 20,height: 20)
                        }
                        Text("This is text")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading).padding(.leading , 20).padding(.trailing, 20).padding(.top,20)
                        .padding(.bottom,0)
                    VStack(alignment: .leading,spacing: 5) {
                        Text("Website").fontWeight(.bold)
                        Text("https:tpcreative.co")
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment : .leading)
                    .padding(.leading,20).padding(.top,5).padding(.trailing,20).padding(.bottom,20)
                   
                }.background(.white)
                
            }
            .background(Color(hex : Constant.light_gray))
            .clipped()
            
            
        }
        .navigationBarItems( trailing:HStack {
            Button() {
                print("About tapped!")
            }label: {
                Image(systemName: "trash")
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
            }
            
            Button() {
                print("Help tapped!")
            }label: {
                Image(systemName: "doc.on.doc")
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
            }
            
            Button() {
                print("Help tapped!")
            }label: {
                Image(systemName: "square.and.pencil")
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
            }
            
            
            Button() {
                print("Help tapped!")
            }label: {
                Image(systemName: "square.and.arrow.up")
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
            }
        })
    }
}

#Preview {
    DetailsView()
}
