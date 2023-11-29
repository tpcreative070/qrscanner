//
//  QRCodeCategoryModel.swift
//  qrscanner
//
//  Created by phong on 29/11/2023.
//

import Foundation
class QRCodeCategoryModel  : Hashable {

    var id : String = UUID().uuidString
    var title : String = ""
    var icon : String = ""
    var type : TypeFormat = TypeFormat.QRCODE
    
    init(_ title: String? = nil,_ icon: String? = nil,_ type : TypeFormat = TypeFormat.QRCODE) {
        self.title = title ?? ""
        self.icon = icon ?? ""
        self.type = type
    }
    
    init(){
        
    }
    
    var list : [QRCodeCategoryModel]  {
        var mList : [QRCodeCategoryModel] = []
        mList.append(QRCodeCategoryModel("Website","network"))
        mList.append(QRCodeCategoryModel("Contact","person.crop.circle"))
        mList.append(QRCodeCategoryModel("Wifi","wifi"))
        mList.append(QRCodeCategoryModel("Text","doc.text"))
        mList.append(QRCodeCategoryModel("Email","envelope"))
        mList.append(QRCodeCategoryModel("SMS","message"))
        mList.append(QRCodeCategoryModel("Call","phone"))
        mList.append(QRCodeCategoryModel("EAN-13","doc",TypeFormat.BARCODE))
        mList.append(QRCodeCategoryModel("EAN-8","doc",TypeFormat.BARCODE))
        mList.append(QRCodeCategoryModel("UPC-A","doc",TypeFormat.BARCODE))
        mList.append(QRCodeCategoryModel("UPC-E","doc",TypeFormat.BARCODE))
        return mList
    }
    
    
}

enum TypeFormat : String {
  case QRCODE, BARCODE
}



extension Hashable where Self: AnyObject{

  func hash(into hasher: inout Hasher) {

     hasher.combine(ObjectIdentifier(self))
   }
}


extension Equatable where Self: AnyObject{

   static func ==(lhs: Self, rhs: Self) -> Bool {
      return lhs === rhs
   }
}
