//
//  QRWriter.swift
//  qrscanner
//
//  Created by phong on 21/11/2023.
//

import Foundation
import ZXingCpp
class QRWriter {
    
    func writeQRCode() -> CGImage?{
        let hints = ZXIEncodeHints(format: .QR_CODE, width: 200, height: 200, ecLevel: QR_ERROR_CORRECTION_LOW, margin: -1)
        guard let image = try? ZXIBarcodeWriter().write("Hello", hints: hints)else {return nil}
        return image.takeRetainedValue()
    }
    
}
