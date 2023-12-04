//
//  GenerateModel.swift
//  qrscanner
//
//  Created by phong on 03/12/2023.
//

import Foundation

class GenerateModel   : ObservableObject{
    var email: String?
    var subject: String?
    var message: String?
    var phone: String?
    var lat: Double?
    var lon: Double?
    var query: String?
    var title: String?
    var location: String?
    var _description: String?
    var startEvent: String?
    var endEvent: String?
    var startEventMilliseconds: Int32 = 0
    var endEventMilliseconds: Int32 = 0
    var fullName: String?
    var address: String?
    var text: String?
    var ssId: String?
    var hidden: Bool = false
    var password: String?
    var url: String?
    var createType: String?
    var networkEncryption: String?
    var createDatetime: String? = ""
    var barcodeFormat: String?
    var favorite: Bool = false
    var updatedDateTime: String?
    var contentUnique: String? = ""
    var isSynced : Bool = false
    var uuId: String? = ""
    var noted : String? = ""
    var code : String? = ""
    var hiddenDatetime: String?
    var typeSave: EnumTypeSave?
    
    init() {
        
    }
    init(text : String){
        self.text = text
    }
    
    var _text: String {
        return text ?? ""
    }
}
