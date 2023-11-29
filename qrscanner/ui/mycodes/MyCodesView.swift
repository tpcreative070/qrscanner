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
    
    @ObservedResults(HistoryModel.self) var persons
    @State var isPresented : Bool = false
    var body: some View {
        NavigationView {
              ScrollView {
                  VStack{
                      
                  }//: VStack
              }//: Scroll
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
              .padding()
          }//: Navigation
     
//        List {
//            ForEach(persons) { person in
//                Text(person.id)
//            }
//            .onDelete(perform: $persons.remove)
//        }.onAppear(){
//            $persons.append(HistoryModel())
//        }
    }
    
}

#Preview {
    MyCodesView()
}
