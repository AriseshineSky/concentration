//
//  Card.swift
//  ConcentrationCopy
//
//  Created by Sky on 4/11/19.
//  Copyright © 2019 OU. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    static var identityFactory = 0
    static func getUniqueIdentifier() -> Int {
        identityFactory += 1
        return identityFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
