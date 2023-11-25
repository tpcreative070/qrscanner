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
       
       var body: some View {
           List {
               ForEach(persons) { person in
                   Text(person._id)
               }
             
               .onDelete(perform: $persons.remove)
           }.onAppear(){
               $persons.append(HistoryModel())
           }
       }
    
}

#Preview {
    MyCodesView()
}
