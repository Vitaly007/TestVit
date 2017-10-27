//
//  textDelegation.swift
//  TestVit
//
//  Created by Vitaly Asadullin on 16.10.17.
//  Copyright © 2017 home. All rights reserved.
//

import Foundation
import UIKit
extension ViewController {
    //запретим набирать в текстбоксах символы кроме цифр
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        //        let compSepByCharInSet = string.components(separatedBy: aSet)
        //        let numberFiltered = compSepByCharInSet.joined(separator: "")
        //        return string == numberFiltered
        //или так
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
