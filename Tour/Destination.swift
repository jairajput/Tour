//
//  Destination.swift
//  Tour
//
//  Created by Jai  on 09/10/23.
//

import Foundation
import SwiftData


@Model
class Destination{
    
   
    var name: String
    var detail: String
    var date : Date
    var priority:Int
    @Relationship(deleteRule: .cascade) var sights = [Sight]()

    init(name: String = "",  detail: String = "", date: Date = .now, priority:Int = 2) {
        self.name = name
        self.detail = detail
        self.date = date
        self.priority = priority
    }
}
