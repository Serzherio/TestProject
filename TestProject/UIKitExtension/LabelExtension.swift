//
//  LabelExtension.swift
//  TestProject
//
//  Created by Сергей on 14.04.2022.
//

import UIKit

// custom init with text in label
extension UILabel {
    convenience init(textLabel: String) {
        self.init()
        self.text = textLabel
    }
}
