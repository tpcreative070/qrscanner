//
//  MyCodesView.swift
//  qrscanner
//
//  Created by phong on 21/11/2023.
//

import Foundation
import SwiftUI
import RealmSwift
struct MyCodesView  : View{
    
    @ObservedResults(HistoryModel.self) var myCodesList
  
    @State var isPresented : Bool = false
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, content: {
                List {
                    ForEach(myCodesList, id: \.self){ index in
                        HStack {
                            Image(systemName: index.iconView).frame(width:30,height:30)
                            VStack(alignment: .leading, content: {
                                Text(index.titleView)
                                Text(index.contentView)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14))
                                   
                            })
                        }
                  }
                }
                .listStyle(.plain)
            })
            .toolbar(content: {
                  ToolbarItemGroup(placement: .navigationBarLeading) {
                      Button {
                          isPresented = true
                      } label: {
                          Image(systemName: "plus.circle")
                      }
                      .fullScreenCover(isPresented: $isPresented, content: {
                          GenerateCategoryView()
                      })
                  }
              })
              .toolbar(content: {
                  ToolbarItemGroup(placement: .navigationBarTrailing) {
                      Button {
            
                      } label: {
                          Text("Edit")
                      }
                  }
              })
              .navigationBarTitle("My codes")
              .navigationBarTitleDisplayMode(.inline)
              .background(.white)
          }//: Navigation
    }
}

#Preview {
    MyCodesView()
}
