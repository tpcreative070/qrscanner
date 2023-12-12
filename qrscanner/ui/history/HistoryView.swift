//
//  HistoryView.swift
//  qrscanner
//
//  Created by phong on 21/11/2023.
//

import Foundation
import SwiftUI
import NavigationSearchBar
import RealmSwift
struct HistoryView : View {
    @State private var search = ""
    @State var scopeSelection: Int = 0
    @ObservedResults(HistoryModel.self) var historyList
    
    var body : some View {
        NavigationView {
            VStack{
                List {
                    ForEach(historyList ,id:\.self) { value in
                        HStack {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("\(value.text ?? "")")
                            }
                        }
                    }
                }.listStyle(.plain)
            }
            .navigationTitle("History")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button {
                        
                    }label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    
                    Button {
                        
                    }label: {
                        Image(systemName: "square.and.arrow.down")
                    }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        
                    }label: {
                        Text("Edit")
                    }
                }
            }
            .navigationSearchBar(text: $search,
                                 scopeSelection: $scopeSelection,
                                 options: [
                                    .automaticallyShowsSearchBar: true,
                                    .obscuresBackgroundDuringPresentation: true,
                                    .hidesNavigationBarDuringPresentation: true,
                                    .hidesSearchBarWhenScrolling: false,
                                    .placeholder: "Search",
                                    .showsBookmarkButton: true,
                                    .scopeButtonTitles: ["All", "Missed", "Other"]
                                 ],
                                 actions: [
                                    .onCancelButtonClicked: {
                                        print("Cancel")
                                    },
                                    .onSearchButtonClicked: {
                                        print("Search")
                                    },
                                    .onBookmarkButtonClicked: {
                                        print("Present Bookmarks")
                                    }
                                 ], searchResultsContent: {
                                     NavigationLink(destination: Text("Destination")) {
                                         Text("Search Results for \(search) in \(String(scopeSelection))")
                                     }
                                 })
        }
    }
}

#Preview {
    HistoryView()
}
