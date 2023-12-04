//
//  MyReviewCode.swift
//  qrscanner
//
//  Created by phong on 30/11/2023.
//

import Foundation
import SwiftUI
import Kingfisher
import RealmSwift

struct MyReviewCode : View {
    
    var data : GenerateModel
    @State var image : CGImage?
    @ObservedResults(HistoryModel.self) var itemsList
    
    var body: some View {
        ScrollView {
            VStack {
               Text("QR code - Text")
                if let mImage = image {
                    Image(uiImage: UIImage(cgImage: mImage))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
                        .frame(maxWidth:400,maxHeight:400)
                }
            }
            VStack(alignment: .leading, content: {
                HStack() {
                    Image(systemName: "pencil.circle")
                    Text("Edit content")
                    Spacer()
                }
                Spacer(minLength: 20)
                HStack() {
                    Image(systemName: "pencil.circle")
                    Text("Share image")
                    Spacer()
                }.background(.white)
            })
            .frame(maxWidth:.infinity,alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 10)
            .padding(.bottom,10)
            .padding(.trailing,10)
            .background(.white)
          
            Text("Preview")
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
                .font(.system(size: 20).bold())
                
            VStack(alignment: .leading,content :{
                Text("QR code-Text")
                Text(data._text)
                Spacer()
            })
            .frame(maxWidth:.infinity,alignment :.leading)
            .padding(.leading, 10)
            .padding(.top, 10)
            .padding(.bottom,10)
            .padding(.trailing,10)
            .background(.white)
            
            Spacer(minLength: 20)
            
            HStack( content: {
                Image("content_copy")
                Text("Copy content")
            })
            .frame(maxWidth:.infinity,alignment: .leading)
            .padding(.leading,10)
            .padding(.top,10)
            .padding(.trailing,10)
            .padding(.bottom,10)
            .background(.white)
            
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                    
//                    Button {
//                        print("Trash")
//                    }label: {
//                        Image(systemName: "trash")
//                    }
//                    
//                    Button {
//                        print("Copy")
//                    }label: {
//                        Image(systemName: "plus.rectangle.on.rectangle")
//                    }
//                    
//                    Button {
//                        print("Duplicated")
//                    }label: {
//                        Image(systemName: "square.and.pencil")
//                    }
                    
                    Button {
                        $itemsList.append(HistoryModel(data:data))
                        print("Done")
                    }label: {
                        Text("Done")
                    }
                })
            }
        }.background(Color(hex: Constant.light_gray))
        .onAppear(){
            self.image = QRWriter().writeQRCode(data._text)
        }
    }
}

#Preview {
    MyReviewCode(data: GenerateModel())
}
