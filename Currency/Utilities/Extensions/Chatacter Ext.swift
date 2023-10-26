//
//  Chatacter Ext.swift
//  Currency
//
//  Created by Юрий Кручинин on 24/10/23.
//

import Foundation

extension Character {
    static var randomAlphabetCharacter: Character {
        let lettersArray: [Character] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
            "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        return lettersArray.randomElement() ?? "A"
    }
}
