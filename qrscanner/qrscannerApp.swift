//
//  qrscannerApp.swift
//  qrscanner
//
//  Created by phong on 16/11/2023.
//

import SwiftUI
import ZXingCpp
import RealmSwift
@main
struct qrscannerApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear(){
                print(Realm.Configuration.defaultConfiguration.fileURL!)
            }
        }
    }
}
