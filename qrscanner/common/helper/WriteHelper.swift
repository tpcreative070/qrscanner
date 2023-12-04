//
//  WriteHelper.swift
//  qrscanner
//
//  Created by phong on 27/11/2023.
//

import Foundation
class WriteHelper  {
    func scannerResult(mValue : String, mType : String) -> HistoryModel?{
        print(mValue)
        var typeCode = ""
        var value_content : String = ""
        var isCode = "QRCode"
        var flagDuplicate = false
        if ((mValue.range(of: "http://", options: .caseInsensitive)) != nil || (mValue.range(of: "https://", options: .caseInsensitive)) != nil){
            typeCode = EnumType.URL.rawValue
            let content = HistoryModel(url: mValue)
            content.typeSave = .HISTORY
            content.createType = EnumType.URL.rawValue
            return content
        }
        else if (mValue.contains("geo")) {
            typeCode = EnumType.LOCATION.rawValue
            if mValue.count > 0 {
                if mValue.contains(":") {
                    let arr_split_colon = mValue.split(separator: ":")
                    if arr_split_colon.count > 1 {
                        let arr_split_comma = arr_split_colon[1].split(separator: ",")
                        if arr_split_comma.count > 1{
                            let arr_split_question = arr_split_comma[1].split(separator: "?")
                            if arr_split_question.count > 1 {
                                let lat = Float(arr_split_comma[0]) ?? 0
                                let lon = Float(arr_split_question[0]) ?? 0
                                let arr_split_equal = arr_split_question[1].split(separator: "=")
                                let query = arr_split_equal[1]
                                
                                let content = HistoryModel(latitude: Double(lat), longtitude: Double(lon), query: String(query))
                                content.typeSave = .HISTORY
                                content.createType = EnumType.LOCATION.rawValue
                                return content
                            }
                        }
                    }
                }
            }
        }
        else if ((mValue.range(of: "mailto", options: .caseInsensitive)) != nil) || ((mValue.range(of: "MATMSG", options: .caseInsensitive)) != nil){
            typeCode = EnumType.EMAIL.rawValue
            var email : String = ""
            var sub : String = ""
            var body : String = ""
            if ((mValue.range(of: "MATMSG", options: .caseInsensitive)) != nil) {
                let arr_semi_colon = mValue.split(separator: ";")
                let arr_first = arr_semi_colon[0].split(separator: ":")
                if arr_first.count > 2
                {
                    email = String(arr_first[2])
                    
                }
                if arr_semi_colon.count > 1 {
                    sub = String((arr_semi_colon[1].split(separator: ":"))[1])
                    if arr_semi_colon.count > 2{
                        body = String((arr_semi_colon[2]).split(separator: ":")[1])
                    }
                }
            }
            if ((mValue.range(of: "mailto", options: .caseInsensitive)) != nil) {
                if mValue.contains("?"){
                    let arr_ques = mValue.split(separator: "?")
                    email = String((arr_ques[0].split(separator: ":"))[1])
                    if arr_ques.count > 1{
                        if arr_ques[1].contains("&"){
                            let arr_and = arr_ques[1].split(separator: "&")
                            sub = String((arr_and[0].split(separator: "="))[1])
                            body = String((arr_and[1].split(separator: "="))[1])
                            
                        }
                    }
                }
                else{
                    if mValue.split(separator: ":").count > 1 {
                        email = String(mValue.split(separator: ":")[1])
                    }
                }
                
            }
            let content = HistoryModel(email: String(email ), subjectEmail: String(sub), messageEmail: String(body))
            content.typeSave = .HISTORY
            content.createType = EnumType.EMAIL.rawValue
            return content
        }
        else if (mValue.contains("BEGIN:VCALENDAR")) || (mValue.contains("BEGIN:VEVENT")){
            typeCode = EnumType.EVENT.rawValue
            var summary : String = ""
            var location : String = ""
            var description : String = ""
            var dtstart : String = ""
            var dtend : String = ""
            var arr_space : Array<Substring>
            if  mValue.contains("\r"){
                arr_space = mValue.split(separator: "\r\n")
            }
            else {
                arr_space = mValue.split(separator: "\n")
            }
            
            if arr_space.count > 0{
                for item in arr_space {
                    if(item.contains("SUMMARY")){
                        if item.split(separator: ":").count > 1
                        {
                            summary = String((item.split(separator: ":"))[1])
                        }
                    }
                    if(item.contains("LOCATION"))
                    {
                        if item.split(separator: ":").count > 1
                        {
                            location = String(item.split(separator: ":")[1])
                        }
                    }
                    if(item.contains("DESCRIPTION")){
                        if item.split(separator: ":").count > 1
                        {
                            description = String(item.split(separator: ":")[1])
                        }
                    }
                    if (item.contains("DTSTART")){
                        if item.split(separator: ":").count > 1
                        {
                            dtstart = String((item.split(separator: ":"))[1])
                        }
                    }
                    if (item.contains("DTEND")){
                        if item.split(separator: ":").count > 1
                        {
                            dtend = String((item.split(separator: ":"))[1])
                        }
                    }
                }
            }
            
            guard let datestart = TimeHelper.getDate(timeString: dtstart), let dateend = TimeHelper.getDate(timeString: dtend) else {return nil}
            let content = HistoryModel(title: summary, location: location, description: description, startEvent: datestart, endEvent: dateend)
            content.typeSave = .HISTORY
            content.createType = EnumType.EVENT.rawValue
            return content
        }
        else if ((mValue.range(of: "SMS", options: .caseInsensitive)) != nil){
            var to : String = ""
            var message : String = ""
            typeCode = EnumType.MESSAGE.rawValue
            let arr_mess = mValue.split(separator: ":")
            if arr_mess.count > 1 {
                to = String(arr_mess[1])
            }
            if arr_mess.count > 2 {
                message = String(arr_mess[2])
            }
            let content = HistoryModel(to: to , message: message)
            content.typeSave = .HISTORY
            content.createType = EnumType.MESSAGE.rawValue
            return content
        }
        else if ((mValue.range(of: "WIFI", options: .caseInsensitive)) != nil) {
            typeCode = EnumType.WIFI.rawValue
            var ssid : String = ""
            var protect : String = ""
            var pass : String = ""
            var hidden : Bool = false
            let start = mValue.index(mValue.startIndex, offsetBy: 5)
            let end = mValue.index(mValue.endIndex, offsetBy: 0)
            let new_mValue = String(mValue[start..<end])
            let arr_semi_colon = new_mValue.split(separator: ";")
            for item in arr_semi_colon {
                print(item)
                if (item.contains("S:"))
                {
                    ssid = item.replacingOccurrences(of: "S:", with: "", options: NSString.CompareOptions.literal, range: nil)
                       

                }
                if (item.contains("T:"))
                {
                    if item.split(separator: ":").count > 1
                    {
                        protect = String((item.split(separator: ":"))[1])
                    }
                }
                if (item.contains("P:"))
                {
                    if item.split(separator: ":").count > 1
                    {
                        pass = String((item.split(separator: ":"))[1])
                    }
                }
                if (item.contains("H:")){
                    let value = item.replacingOccurrences(of: "H:", with: "", options: NSString.CompareOptions.literal, range: nil)
                    if (value.caseInsensitiveCompare("True") == .orderedSame) {
                        hidden = true
                    }
                    else {
                        hidden = false
                    }
                }
            }
            print(ssid)
            let content = HistoryModel(ssid: ssid, password: pass, protect: protect, hidden: hidden)
            content.typeSave = .HISTORY
            content.createType = EnumType.WIFI.rawValue
            return content
        }
        else if (mValue.contains("MECARD")) || (mValue.contains("VCARD")) || (mValue.contains("MCARD")) {
            typeCode = EnumType.CONTACT.rawValue
            var fullName : String = ""
            var address : String = ""
            var phone : String = ""
            var email : String = ""
            
            if mValue.contains("MCARD") || mValue.contains("MECARD"){
                let start = mValue.index(mValue.startIndex, offsetBy: 6)
                let end = mValue.index(mValue.endIndex, offsetBy: 0)
                let new_mValue = String(mValue[start..<end])
                let arr_semi_colon = new_mValue.split(separator: ";")
                for item in arr_semi_colon {
                    if item.split(separator: ":").count > 1
                    {
                        if (item.contains("N:"))
                        {
                            fullName = item.replacingOccurrences(of: "N:", with: "", options: NSString.CompareOptions.literal, range: nil)
                        }
                        if (item.contains("FN:"))
                        {
                            fullName = item.replacingOccurrences(of: "FN:", with: "", options: NSString.CompareOptions.literal, range: nil)
                        }
                        if (item.contains("TEL"))
                        {
                            phone = String((item.split(separator: ":"))[1])
                        }
                        if (item.contains("EMAIL"))
                        {
                            email = String((item.split(separator: ":"))[1])
                        }
                        if (item.contains("ADR"))
                        {
                            address = String((item.split(separator: ":"))[1])
                        }
                    }
                }
            }
            if mValue.contains("VCARD"){
                let arr_space = mValue.split(separator: "\n")
                if arr_space.count > 0{
                    for item in arr_space {
                        if item.split(separator: ":").count > 1
                        {
                            if (item.contains("N:"))
                            {
                                fullName = item.replacingOccurrences(of: "N:", with: "", options: NSString.CompareOptions.literal, range: nil)
                            }
                            if (item.contains("FN:"))
                            {
                                fullName = item.replacingOccurrences(of: "FN:", with: "", options: NSString.CompareOptions.literal, range: nil)
                            }
                            if(item.contains("EMAIL"))
                            {
                                email = String(item.split(separator: ":")[1])
                            }
                            if(item.contains("TEL")){
                                phone += String(item.split(separator: ":")[1])
                            }
                            if (item.contains("ADR")){
                                address = String((item.split(separator: ":"))[1])
                            }
                        }
                    }
                }
                
            }
            let content = HistoryModel(fullNameContact: fullName, addressContact: address, phoneContact: phone, emailContact: email)
            content.typeSave = .HISTORY
            content.createType = EnumType.CONTACT.rawValue
        }
        else if (mValue.caseInsensitiveCompare("tel") == .orderedSame || (mValue.range(of: "TEL", options: .caseInsensitive)) != nil) {
            typeCode = EnumType.TELEPHONE.rawValue
            var tel : String = ""
            if mValue.split(separator: ":").count > 1
            {
                tel = String(mValue.split(separator: ":")[1])
            }
            let content = HistoryModel(phone: tel)
            content.createType = EnumType.TELEPHONE.rawValue
            content.typeSave = .HISTORY
        }
        else if ((mType.range(of: "EAN-13", options: .caseInsensitive)) != nil){
            let content = HistoryModel(productId: mValue, type: BarcodeType.EAN_13)
            content.typeSave = .HISTORY
            content.createType = EnumType.BARCODE.rawValue
            return content
        }
        else if ((mType.range(of: "EAN-8", options: .caseInsensitive)) != nil){
            let content = HistoryModel(productId: mValue, type: BarcodeType.EAN_8)
            content.typeSave = .HISTORY
            content.createType = EnumType.BARCODE.rawValue
            return content
        }
        else if ((mType.range(of: "PDF417", options: .caseInsensitive)) != nil){
            let content = HistoryModel(productId: mValue, type: BarcodeType.PDF417)
            content.typeSave = .HISTORY
            content.createType = EnumType.BARCODE.rawValue
            return content
        }
        else if ((mType.range(of: "Aztec", options: .caseInsensitive)) != nil){
            let content = HistoryModel(productId: mValue, type: BarcodeType.Aztec)
            content.typeSave = .HISTORY
            content.createType = EnumType.BARCODE.rawValue
            return content
        }
        else if ((mType.range(of: "UPCE", options: .caseInsensitive)) != nil){
            let content = HistoryModel(productId: mValue, type: BarcodeType.UPCE)
            content.typeSave = .HISTORY
            content.createType = EnumType.BARCODE.rawValue
            return content
        }
        else if ((mType.range(of: "UPCA", options: .caseInsensitive)) != nil){
            let content = HistoryModel(productId: mValue, type: BarcodeType.UPCA)
            content.typeSave = .HISTORY
            content.createType = EnumType.BARCODE.rawValue
            return content
        }
        else if ((mType.range(of: "Code128", options: .caseInsensitive)) != nil){
            let content = HistoryModel(productId: mValue, type: BarcodeType.CODE128)
            content.typeSave = .HISTORY
            content.createType = EnumType.BARCODE.rawValue
            return content
        }
        else if ((mType.range(of: "Code93", options: .caseInsensitive)) != nil){
            let content = HistoryModel(productId: mValue, type: BarcodeType.CODE93)
            content.typeSave = .HISTORY
            content.createType = EnumType.BARCODE.rawValue
            return content
        }
        else if ((mType.range(of: "Code39", options: .caseInsensitive)) != nil){
            let content = HistoryModel(productId: mValue, type: BarcodeType.CODE39)
            content.typeSave = .HISTORY
            content.createType = EnumType.BARCODE.rawValue
            return content
        }
        else if ((mType.range(of: "Codabar", options: .caseInsensitive)) != nil){
            let content = HistoryModel(productId: mValue, type: BarcodeType.CODABAR)
            content.typeSave = .HISTORY
            content.createType = EnumType.BARCODE.rawValue
            return content
        }
        else if ((mType.range(of: "ITF", options: .caseInsensitive)) != nil){
            let content = HistoryModel(productId: mValue, type: BarcodeType.ITF)
            content.typeSave = .HISTORY
            content.createType = EnumType.BARCODE.rawValue
            return content
        }
        else{
            let content = HistoryModel(text: String(mValue))
            content.typeSave = .HISTORY
            content.createType = EnumType.TEXT.rawValue
            return content
        }
//        if (typeCode.count == 0 || value_content.count == 0 || typeCode == "" || value_content == "")
//        {
//            print("Empty value")
//        }
//        else
//        {
//            print("giatr :\(value_content)")
//            let createDateTime = Date().millisecondsSince1970
//            if isScanner {
//                if UserDefaults.standard.bool(forKey:KeyUserDefault.MultiScan){
//                    if Bool(truncating: CommonService.getUserDefault(key: KeyUserDefault.Duplicate) ?? false){
//                        if listResultScanner.count > 0 {
//                            for item in listResultScanner {
//                                if !(item.content! == value_content && item.typeCode! == typeCode && item.isCode! == isCode){
//                                    
//                                    flagDuplicate = true
//                                }
//                                else{
//                                    flagDuplicate = false
//                                    break
//                                }
//                                
//                            }
//                            if flagDuplicate {
//                                listResultScanner.append(GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
//                                let mValue = GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode)
//                                if !checkItemExist(mValue: mValue){
//                                    let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
//                                    if result {
//                                        print("insert success")
//                                    }
//                                }
//                                
//                            }
//                        }
//                        else{
//                            listResultScanner.append(GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
//                            let mValue = GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode)
//                            if !checkItemExist(mValue: mValue){
//                                let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
//                                if result {
//                                    print("insert success")
//                                }
//                            }
//                        }
//                    }
//                    else
//                    {
//                        let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
//                        if result {
//                            print("insert success")
//                        }
//                    }
//                    
//                    
//                }
//                else{
//                    if Bool(truncating: CommonService.getUserDefault(key: KeyUserDefault.Duplicate) ?? false){
//                        let mValue = GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: "", isCode: isCode)
//                        if !checkItemExist(mValue: mValue){
//                            let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
//                            if result {
//                                if result {
//                                    guard let itemScanner = SQLHelper.getItemScanner(createDateTime: createDateTime) else {return}
//                                    guard let typeCode = itemScanner.typeCode?.lowercased(), let content = itemScanner.content else {return}
//                                    let value = ContentViewModel(data: ContentModel(typeCode : typeCode, content: content))
//                                    listTransaction.append(value)
//                                    self.navigate?()
//                                }
//                            }
//                        }
//                        else{
//                            self.navigate?()
//                        }
//                    }
//                    else
//                    {
//                        print("value content scanner :\(value_content)")
//                        let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
//                        if result {
//                            if result {
//                                guard let itemScanner = SQLHelper.getItemScanner(createDateTime: createDateTime) else {return}
//                                guard let typeCode = itemScanner.typeCode?.lowercased(), let content = itemScanner.content else {return}
//                                let value = ContentViewModel(data: ContentModel(typeCode : typeCode, content: content))
//                                listTransaction.append(value)
//                                self.navigate?()
//                            }
//                        }
//                    }
//                }
//            }
//            else{
//                
//                if Bool(truncating: CommonService.getUserDefault(key: KeyUserDefault.Duplicate) ?? false){
//                    let mValue = GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode)
//                    if !checkItemExist(mValue: mValue){
//                        let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
//                        if result {
//                            print("insert success")
//                        }
//                    }
//                    else{
//                        
//                        
//                    }
//                    
//                }
//                else
//                {
//                    let result = SQLHelper.insertedScanner(data: GenerateEntityModel(createdDateTime: createDateTime, typeCode: typeCode, content: value_content, isHistory: true, isSave: false, updatedDateTime:createDateTime, bookMark: false, transactionID: dateTime, isCode: isCode))
//                    if result {
//                        print("insert success")
//                    }
//                    
//                    
//                }
//            }
//        }
        return nil
    }
}
