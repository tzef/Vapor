//
//  Acronym.swift
//  App
//
//  Created by LEE ZHE YU on 2019/2/11.
//

import Vapor
import FluentSQLite

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String
    init(short: String, long: String) {
        self.short = short
        self.long = long
    }
}

extension Acronym: SQLiteModel {}
extension Acronym: Migration {}
extension Acronym: Content {}
//extension Acronym: Model {
//    typealias Database = SQLiteDatabase
//    typealias ID = Int
//    public static var idKey: IDKey = \Acronym.id
//}
