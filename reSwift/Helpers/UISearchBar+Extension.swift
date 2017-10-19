//
//  UISearchBar+Extension.swift
//  reSwift
//
//  Created by Ruslan Yupyn on 10/19/17.
//  Copyright © 2017 Crossroad Labs s.r.o. All rights reserved.
//

import UIKit

extension UISearchBar {
    func changeSearchBarColor(color : UIColor) {
        for subView in self.subviews {
            for subSubView in subView.subviews {
                if subSubView.conforms(to: UITextInputTraits.self) {
                    let textField = subSubView as! UITextField
                    textField.backgroundColor = color
                    break
                }
            }
        }
    }
    
    func changeSearchTextColor(color: UIColor) {
        if let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField {
            textFieldInsideSearchBar.textColor = color
        }
    }
    
    func clearBackground() {
        self.backgroundImage = UIImage()
        self.barTintColor = .clear
    }
}
