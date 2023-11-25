//
//  HistoryModel.swift
//  qrscanner
//
//  Created by phong on 22/11/2023.
//

import Foundation
import SwiftData
import RealmSwift

class HistoryModel  : Object ,Identifiable {
    @Persisted(primaryKey: true) var _id: String = UUID().uuidString
    @Persisted var name: String
    @Persisted var age: Int
    // Create relationships by pointing an Object field to another Class
    @Persisted var dogs: List<Dog>
    
    override init() {
        name = "dog"
        age = 20
    }
  
}


class Dog: Object {
    @Persisted var name: String
    @Persisted var age: Int
}
