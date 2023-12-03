//
//  MyTextField.swift
//  qrscanner
//
//  Created by phong on 30/11/2023.
//

import Foundation
import SwiftUI

struct MyTextField : View {
    @Binding var value : String
    let title: String
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(title)
                .foregroundColor(.gray)
            TextField("", text: $value)
                .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.white))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 1)
                    )
                    .foregroundColor(.black)
        })
        .padding(20)
    }
}


#Preview {
    MyTextField(value: .constant("Enter a text"), title: "TEXT")
}
