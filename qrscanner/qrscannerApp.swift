//
//  qrscannerApp.swift
//  qrscanner
//
//  Created by phong on 16/11/2023.
//

import SwiftUI
import ZXingCpp
@main
struct qrscannerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class Test {
    init(){
        let hints = ZXIEncodeHints(format: .QR_CODE, width: 200, height: 200, ecLevel: QR_ERROR_CORRECTION_LOW, margin: -1)
    }
}
