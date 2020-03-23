//
//  CommentGenerator.swift
//  commentCardWriter
//
//  Created by Bryson, David (IRG) on 25/02/2020.
//  Copyright © 2020 David Bryson. All rights reserved.
//

import Foundation
class CommentGenerator {
    func simpleComment(enjoymentValue:Int, performanceValue:Int, subject: String, overallFeelingsText:String) -> String {
        let emojiArray = ["Error","😞","🙁","😐","🙂","😁"]
        if subject == "" {
            return "Error, subject not entered"
        } else {
            return """
            Enjoyment: \(emojiArray[enjoymentValue])
            Performace: \(emojiArray[performanceValue])
            Overall feelings: \(overallFeelingsText)
            """
        }
    }
}
