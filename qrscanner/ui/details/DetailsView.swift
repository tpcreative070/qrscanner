//
//  DetailsView.swift
//  qrscanner
//
//  Created by phong on 25/11/2023.
//

import SwiftUI

struct DetailsView : View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                HStack(){
                    Image(systemName: "square.and.arrow.up.circle").frame(width: 30,height: 30)
                    Text("This is text")
                   
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading).padding(.leading, 20)
            }
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
