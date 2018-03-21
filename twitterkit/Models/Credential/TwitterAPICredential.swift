//
//  TwitterAPICredential.swift
//  iosTwitterClient
//
//  Created by yogasawara@stv on 2018/03/19.
//  Copyright © 2018年 sunday carpenter. All rights reserved.
//

import Foundation

struct TwitterAPICredential: JSONDataConvertible, Codable {
    let consumer_key: String
    let consumer_secret: String
}

extension TwitterAPICredential {
    init(json jsonName: String) throws {
        let j = FileOrganizer.open(json: jsonName)
        
        guard let json = j else {
            throw TKError.credentialLoad
        }
        
        let credential = try TwitterAPICredential(json)
        
        self.consumer_key = credential.consumer_key
        self.consumer_secret = credential.consumer_secret
    }
}
