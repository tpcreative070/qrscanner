//
//  MyQRCodesCategoryView.swift
//  qrscanner
//
//  Created by phong on 27/11/2023.
//

import SwiftUI


struct GenerateCategoryView: View {
    let data = QRCodeCategoryModel().list
    @Environment(\.presentationMode) 
    var presentationMode

    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(data , id : \.self) { item in
                        NavigationLink(destination:
                            GenerateView()
                        ) {
                            VStack {
                                Image(systemName: item.icon)
                                Spacer().frame(width: 20)
                                Text(item.title)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark.circle")
                    }
                }
            })
        }
    }
}

#Preview {
    GenerateCategoryView()
}
