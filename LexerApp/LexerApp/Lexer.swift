//
//  Lexer.swift
//  LexerApp
//
//  Created by David Cormell on 13/03/2020.
//  Copyright © 2020 David Cormell. All rights reserved.
//

import Foundation

class Lexer {
    func lex(text: String) -> [Token] {
        text.trimmingCharacters(in: .whitespacesAndNewlines)
        var textArray = text.components(separatedBy: " ")
        //implement lexical analysis in this method. Remember it should:
        //remove whitespace
        //produce an ordered sequence of tokens / lexemes
        print(textArray)
        return []
    }
}
