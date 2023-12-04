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
    
    init(data : GenerateModel) {
        super.init()
        self.text = data._text
        self.typeSave = .GENERATE
        self.createType = EnumType.TEXT.rawValue
    }
    
    //uri
    init(url : String) {
        super.init()
        self.url = url
        self.typeSave = .HISTORY
        self.createType = EnumType.URL.rawValue
    }
    
    /**This is scanner area**/
    
    //GEO
    init(latitude: Double, longtitude: Double, query: String) {
        super.init()
        self.lat = latitude
        self.lon = longtitude
        self.query = query
    }
    
    
    //Email
    init(email: String, subjectEmail: String, messageEmail: String){
        super.init()
        self.email = email
        self.subject = subjectEmail
        self.message = messageEmail
    }
    
    //Calender
    init(title: String, location: String, description: String, startEvent: String, endEvent: String){
        super.init()
        self.title = title
        self.location = location
        self._description = description
        self.startEvent = startEvent
        self.endEvent = endEvent
    }
    
    //Message
    init(to : String, message : String) {
        super.init()
        self.phone = phone
        self.message = message
    }
    
    //Wifi
    init(ssid: String, password: String, protect: String, hidden: Bool) {
        super.init()
        self.ssId = ssid
        self.password = password
        self.networkEncryption  = protect
        self.hidden = hidden
    }
    
    
    //Contact
    init(fullNameContact: String, addressContact: String, phoneContact: String, emailContact: String){
        super.init()
        self.fullName = fullNameContact
        self.address = addressContact
        self.phone = phoneContact
        self.email = emailContact
    }
    
    //phone
    init(phone : String) {
        super.init()
        self.phone = phone
    }
    
    //barcode format
    init(productId : String, type : BarcodeType) {
        super.init()
        self.text = productId
        self.barcodeFormat = type.rawValue
    }
    
    //text
    init(text : String) {
        super.init()
        self.text = text
    }
}

enum EnumTypeSave : String, PersistableEnum {
    case HISTORY,GENERATE
}
