//
//  UserDocumentManager.swift
//  AbsenceRecorder
//
//  Created by Bryson, David (IRG) on 10/03/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import Foundation

class UserDocumentManager {
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
