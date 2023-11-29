//
//  Constant.swift
//  qrscanner
//
//  Created by phong on 26/11/2023.
//

import Foundation
class Constant {
    static let light_gray = "#F2F2F2"
}

enum EnumType : String {
    case BARCODE = "BARCODE"
    case URL = "URL"
    case TEXT = "TEXT"
    case TELEPHONE = "TELEPHONE"
    case EMAIL = "EMAIL"
    case WIFI = "WIFI"
    case CONTACT = "CONTACT"
    case LOCATION = "LOCATION"
    case MESSAGE = "MESSAGE"
    case EVENT = "EVENT"

}
enum BarcodeType : String {
    case EAN_8, EAN_13, PDF417, Aztec, UPCE, UPCA, CODE128, CODE93, CODE39, ITF, CODABAR
    static var allValues = [BarcodeType.EAN_8, .EAN_13, .PDF417, .Aztec, .UPCE, .UPCA, .CODE128, .CODE39, .CODE93, .ITF, .CODABAR]
}
