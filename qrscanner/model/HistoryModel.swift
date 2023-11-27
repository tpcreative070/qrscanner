//
//  HistoryModel.swift
//  qrscanner
//
//  Created by phong on 22/11/2023.
//

import Foundation
import SwiftData
import RealmSwift
import ZXingCpp

class HistoryModel  : Object ,Identifiable {
    
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var email: String?
    @Persisted var subject: String?
    @Persisted var message: String?
    @Persisted var phone: String?
    @Persisted var lat: Double?
    @Persisted var lon: Double?
    @Persisted var query: String?
    @Persisted var title: String?
    @Persisted var location: String?
    @Persisted var _description: String?
    @Persisted var startEvent: String?
    @Persisted var endEvent: String?
    @Persisted var startEventMilliseconds: Int32
    @Persisted var endEventMilliseconds: Int32
    @Persisted var fullName: String?
    @Persisted var address: String?
    @Persisted var text: String?
    @Persisted var ssId: String?
    @Persisted var hidden: Bool
    @Persisted var password: String?
    @Persisted var url: String?
    @Persisted var createType: String?
    @Persisted var networkEncryption: String?
    @Persisted var createDatetime: String? = ""
    @Persisted var barcodeFormat: String?
    @Persisted var favorite: Bool = false
    @Persisted var updatedDateTime: String?
    @Persisted var contentUnique: String? = ""
    @Persisted var isSynced : Bool = false
    @Persisted var uuId: String? = ""
    @Persisted var noted : String? = ""
    @Persisted var code : String? = ""
    @Persisted var hiddenDatetime: String?
    @Persisted var typeSave: EnumTypeSave?
    
    override init() {
        
    }
}


enum EnumTypeSave : String, PersistableEnum {
    case HISTORY,GENERATE
}
