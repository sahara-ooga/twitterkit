//
//  DataConvertible.swift
//  ShowImageAndPlist
//
//  Created by yogasawara@stv on 2018/03/09.
//  Copyright © 2018年 sunday carpenter. All rights reserved.
//

import Foundation

/// Data型との変換が出来ることを示す
protocol DataConvertible {
    init(_ data: Data) throws
    func convertToData() throws -> Data
}

protocol JSONDataConvertible: DataConvertible { }

// MARK: - JSONとしてData型をデコードしたいときの設定
extension JSONDataConvertible where Self: Decodable {
    init(_ data: Data) throws {
        self = try JSONDecoder().decode(Self.self, from: data)
    }
}

extension JSONDataConvertible where Self: Encodable {
    func convertToData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}

protocol PlistConvertible: DataConvertible { }

extension PlistConvertible where Self: Decodable {
    init(_ data: Data) throws {
        self = try PropertyListDecoder().decode(Self.self, from: data)
    }
}

extension PlistConvertible where Self: Encodable {
    func convertToData() throws -> Data {
        return try PropertyListEncoder().encode(self)
    }
}

protocol DataConvertibleStore {
    func set(_ value: DataConvertible, forKey key: String) throws
    func value<T: DataConvertible>(_ type: T.Type, forKey key: String) -> T?
}
