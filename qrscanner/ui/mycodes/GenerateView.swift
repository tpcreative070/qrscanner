//
//  GenerateView.swift
//  qrscanner
//
//  Created by phong on 29/11/2023.
//

import Foundation
import SwiftUI

struct GenerateView : View {
    @State var text : String
    @State private var isShowMyReviewCode = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, content: {
                MyTextField(value: $text, title: "Text")
            })
        }
        .onTapGesture {}
        .onLongPressGesture(
            pressing: { isPressed in if isPressed { self.endEditing() } },
            perform: {})
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(){
                   isShowMyReviewCode = true
                }label: {
                    Text("Create")
                }
                NavigationLink(destination: MyReviewCode(data: GenerateModel(text: text)), isActive: $isShowMyReviewCode, label: { EmptyView() })
            }
        }
    }
}

#Preview {
    GenerateView(text: "Text")
}
