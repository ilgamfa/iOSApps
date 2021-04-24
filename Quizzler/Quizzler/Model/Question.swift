//
//  Question.swift
//  Quizzler
//
//  Created by Ильгам Ахматдинов on 21.04.2021.
//

import Foundation

struct Question {
    var text: String
    var answer: String
    init(q: String, a: String) {
        self.text = q
        self.answer = a

    }
}
