//
//  FileOrganizer.swift
//  iosTwitterClient
//
//  Created by yogasawara@stv on 2018/03/19.
//  Copyright © 2018年 sunday carpenter. All rights reserved.
//

import Foundation

struct FileOrganizer {
    static func open(json fileName: String) -> Data? {
//        let path : String = Bundle.main.path(forResource: fileName, ofType: "json")!
//
//        let fileHandle : FileHandle = FileHandle(forReadingAtPath: path)!
//        return fileHandle.readDataToEndOfFile() as Data
        
        return open(fileName, ext: "json")
    }
    
    static func open(_ fileName: String, ext: String) -> Data? {
//        let path : String = Bundle.main.path(forResource: fileName, ofType: "json")!
        let path = Bundle.main.path(forResource: fileName, ofType: ext)
        
//        let fileHandle : FileHandle = FileHandle(forReadingAtPath: path)!
        
        let fileHandle = path.flatMap(FileHandle.init(forReadingAtPath:))
//        return fileHandle.readDataToEndOfFile() as Data
        return fileHandle?.readDataToEndOfFile()
        
    }
}
