//
//  ReadWriteFile.swift
//  UsersProfile
//
//  Created by Thanh Hoang on 11/23/15.
//  Copyright © 2015 Thanh Hoang. All rights reserved.
//

import Foundation

class ReadWriteFile {
    
    // var fileName: String = "/UserInformation.txt"
    
    init() {
        var text : String = String()
        text += "Thanh;Hoang;131-321-321-131;address 1, Tigard, OR\n"
        text += "FirstNameTest2;LastNameTest2;312-313-3131; address 2, Portland, OR\n"
        text += "FirstNameTest3;LastNameTest3;312-313-3131; address 3, Portland, OR\n"
        text += "FirstNameTest4;LastNameTest4;312-313-3131; address 4, Portland, OR\n"
        text += "FirstNameTest5;LastNameTest5;312-313-3131; address 5, Portland, OR\n"
        text += "FirstNameTest6;LastNameTest6;312-313-3131; address 6, Portland, OR\n"
        text += "FirstNameTest7;LastNameTest7;312-313-3131; address 7, Portland, OR\n"
        text += "FirstNameTest8;LastNameTest8;312-313-3131; address 8, Portland, OR\n"
        text += "FirstNameTest9;LastNameTest9;312-313-3131; address 9, Portland, OR\n"
        text += "FirstNameTest10;LastNameTest10;312-313-3131; address 10, Portland, OR\n"
        
        
        let dirs = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) [0] as String
        let filePath = dirs.stringByAppendingString("/UserInformation.txt")
        
        if let outputStream = NSOutputStream(toFileAtPath: filePath, append: true) {
            outputStream.open()
            outputStream.write(text)
            outputStream.close()
        }
        
        
    }
    
    func ReadFromFile() -> NSMutableArray {
        let usersArray: NSMutableArray = NSMutableArray()
        //var usersArray: [User];
        var aUser: User
        var firstName: String
        var lastName: String
        var phoneNumber: String
        var address: String
        var fileContent : String = String()
        
        let dirs = NSSearchPathForDirectoriesInDomains(.DocumentationDirectory, .UserDomainMask, true) [0] as String
        let filePath = dirs.stringByAppendingString("/UserInformation.txt")
        
        do {
            fileContent = try String(contentsOfFile: filePath, encoding: NSUTF8StringEncoding)
        } catch {}
        
        let lines : [String] = fileContent.componentsSeparatedByString("\n")
        
        for line in lines {
            
            var elementsInLine: [String] = line.componentsSeparatedByString(";")
            
            if elementsInLine.count == 4 {
                firstName = elementsInLine[0]
                lastName = elementsInLine[1]
                phoneNumber = elementsInLine[2]
                address = elementsInLine[3]
                
                aUser = User(firstName: firstName, lastName: lastName, phone: phoneNumber, address: address)
                //  usersArray.append(aUser)
                usersArray.addObject(aUser)
            }
            
        }
        return usersArray
    }
    
    func WriteToFile(firstName: String, lastName: String, phone: String, address: String) {
        let dirs = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) [0] as String
        let filePath = dirs.stringByAppendingString("/UserInformation.txt")
        let text = firstName + ";" + lastName + ";" + phone + ";" + address + "\n"
        
        if let outputStream = NSOutputStream(toFileAtPath: filePath, append: true) {
            outputStream.open()
            outputStream.write(text)
            outputStream.close()
        }
        
    }
    
    func arrayOfUers() -> NSMutableArray {
        var text : String = String()
        text += "Thanh;Hoang;131-321-321-131;address 1, Tigard, OR\n"
        text += "FirstNameTest2;LastNameTest2;312-313-3131; address 2, Portland, OR\n"
        text += "FirstNameTest3;LastNameTest3;312-313-3131; address 3, Portland, OR\n"
        text += "FirstNameTest4;LastNameTest4;312-313-3131; address 4, Portland, OR\n"
        text += "FirstNameTest5;LastNameTest5;312-313-3131; address 5, Portland, OR\n"
        text += "FirstNameTest6;LastNameTest6;312-313-3131; address 6, Portland, OR\n"
        text += "FirstNameTest7;LastNameTest7;312-313-3131; address 7, Portland, OR\n"
        text += "FirstNameTest8;LastNameTest8;312-313-3131; address 8, Portland, OR\n"
        text += "FirstNameTest9;LastNameTest9;312-313-3131; address 9, Portland, OR\n"
        text += "FirstNameTest10;LastNameTest10;312-313-3131; address 10, Portland, OR\n"
        
        
        let usersArray: NSMutableArray = NSMutableArray()
        var aUser: User
        var firstName: String
        var lastName: String
        var phoneNumber: String
        var address: String
        
        let lines : [String] = text.componentsSeparatedByString("\n")
        
        for line in lines {
            
            var elementsInLine: [String] = line.componentsSeparatedByString(";")
            
            if elementsInLine.count == 4 {
                firstName = elementsInLine[0]
                lastName = elementsInLine[1]
                phoneNumber = elementsInLine[2]
                address = elementsInLine[3]
                
                aUser = User(firstName: firstName, lastName: lastName, phone: phoneNumber, address: address)
                //  usersArray.append(aUser)
                usersArray.addObject(aUser)
            }
            
        }
        return usersArray
        
    }
   
}

extension NSOutputStream {
    // Write String to outputStream
    func write(string: String, encoding: NSStringEncoding = NSUTF8StringEncoding, allowLossyConversion: Bool = true) -> Int {
        if let data = string.dataUsingEncoding(encoding, allowLossyConversion: allowLossyConversion) {
            var bytes = UnsafePointer<UInt8>(data.bytes)
            var bytesRemaining = data.length
            var totalBytesWritten = 0
            
            while bytesRemaining > 0 {
                let bytesWritten = self.write(bytes, maxLength: bytesRemaining)
                if bytesWritten < 0 {
                    return -1
                }
                bytesRemaining -= bytesWritten
                bytes += bytesWritten
                totalBytesWritten += bytesWritten
            }
            
            return totalBytesWritten
        }
        
        return -1
    }
}

