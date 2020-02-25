//
//  CommentGenerator.swift
//  commentCardWriter
//
//  Created by Bryson, David (IRG) on 25/02/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import Foundation
class CommentGenerator {
    func simpleComment(value:String, subject: String) -> String {
        if subject == "" {
            return "Error, subject not entered"
        }
        else if value == "1" {
            return "I am not enjoying \(subject)."
        }
        else if value == "2" {
            return "I am not really enjoying \(subject)."
        }
        else if value == "3" {
            return "I am somewhat enjoying \(subject)."
        }
        else if value == "4" {
            return "I am enjoying \(subject)."
        }
        else if value == "5" {
            return "I am enjoying \(subject) a lot."
        }
        else {return "Error, value not entered"}
    }
}
